# API Reference

Complete REST API reference for Terra Lumina renewable energy investment platform.

## Overview

The Terra Lumina API allows developers to integrate renewable energy investment functionality into their applications.

**Base URL:**
```
https://api.terralumina.org/v1
```

**Key features:**

- 🔒 **Secure:** OAuth 2.0 + JWT authentication
- ⚡ **Fast:** Average response time <200ms
- 📊 **RESTful:** Standard HTTP methods and status codes
- 🔄 **Real-time:** WebSocket support for live updates
- 📈 **Scalable:** Rate limiting and pagination
- 📝 **Well-documented:** OpenAPI/Swagger specification

**Client libraries:**
- Python: `pip install terra-lumina`
- JavaScript/TypeScript: `npm install @terra-lumina/sdk`
- Ruby: `gem install terra_lumina`
- Go: `go get github.com/Luminous-Dynamics/terra-lumina-go`

## Authentication

### OAuth 2.0 Flow

Terra Lumina uses **OAuth 2.0** with JWT tokens.

**1. Register your application:**

Visit [terralumina.org/developers/apps](https://terralumina.org/developers/apps) to create an API application and get your credentials:

- `client_id`: Your application ID
- `client_secret`: Your application secret (keep secure!)

**2. Authorization URL:**

```
https://terralumina.org/oauth/authorize?
  client_id=YOUR_CLIENT_ID&
  response_type=code&
  redirect_uri=YOUR_REDIRECT_URI&
  scope=read_profile+read_portfolio+make_investments
```

**3. Exchange code for token:**

```bash
curl -X POST https://api.terralumina.org/v1/oauth/token \
  -H "Content-Type: application/json" \
  -d '{
    "grant_type": "authorization_code",
    "code": "AUTH_CODE_FROM_STEP_2",
    "client_id": "YOUR_CLIENT_ID",
    "client_secret": "YOUR_CLIENT_SECRET",
    "redirect_uri": "YOUR_REDIRECT_URI"
  }'
```

**Response:**
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "Bearer",
  "expires_in": 3600,
  "refresh_token": "tGzv3JOkF0XG5Qx2TlKWIA",
  "scope": "read_profile read_portfolio make_investments"
}
```

**4. Use access token:**

```bash
curl https://api.terralumina.org/v1/user/me \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN"
```

### Refresh Token

When access token expires, use refresh token:

```bash
curl -X POST https://api.terralumina.org/v1/oauth/token \
  -H "Content-Type: application/json" \
  -d '{
    "grant_type": "refresh_token",
    "refresh_token": "YOUR_REFRESH_TOKEN",
    "client_id": "YOUR_CLIENT_ID",
    "client_secret": "YOUR_CLIENT_SECRET"
  }'
```

### API Key (Alternative)

For server-to-server applications, use API keys:

**Generate key:**

Visit [terralumina.org/developers/keys](https://terralumina.org/developers/keys)

**Use key:**

```bash
curl https://api.terralumina.org/v1/projects \
  -H "X-API-Key: YOUR_API_KEY"
```

### Scopes

| Scope | Description |
|-------|-------------|
| `read_profile` | Read user profile information |
| `write_profile` | Update user profile |
| `read_portfolio` | Read investment portfolio |
| `read_projects` | Read project information |
| `make_investments` | Create investments |
| `read_returns` | Read return distributions |
| `claim_returns` | Claim return distributions |
| `admin` | Full administrative access |

## Rate Limiting

**Limits by tier:**

| Tier | Requests/Hour | Burst |
|------|---------------|-------|
| **Free** | 100 | 20 |
| **Basic** | 1,000 | 100 |
| **Pro** | 10,000 | 500 |
| **Enterprise** | Unlimited | Unlimited |

**Headers:**

Every response includes rate limit headers:

```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 995
X-RateLimit-Reset: 1637150400
```

**Rate limit exceeded:**

```json
{
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Rate limit exceeded. Please try again in 600 seconds.",
    "retry_after": 600
  }
}
```

## Pagination

List endpoints support cursor-based pagination:

**Request:**
```bash
curl "https://api.terralumina.org/v1/projects?limit=20"
```

**Response:**
```json
{
  "data": [...],
  "pagination": {
    "next_cursor": "eyJpZCI6MTIzfQ==",
    "has_more": true,
    "total": 1247
  }
}
```

**Next page:**
```bash
curl "https://api.terralumina.org/v1/projects?limit=20&cursor=eyJpZCI6MTIzfQ=="
```

## Error Handling

### Standard Error Response

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable error message",
    "details": {
      "field": "Additional error context"
    },
    "request_id": "req_abc123"
  }
}
```

### HTTP Status Codes

| Code | Meaning | Description |
|------|---------|-------------|
| 200 | OK | Request succeeded |
| 201 | Created | Resource created |
| 400 | Bad Request | Invalid request parameters |
| 401 | Unauthorized | Missing or invalid authentication |
| 403 | Forbidden | Authenticated but not authorized |
| 404 | Not Found | Resource doesn't exist |
| 422 | Unprocessable Entity | Validation failed |
| 429 | Too Many Requests | Rate limit exceeded |
| 500 | Internal Server Error | Server error |
| 503 | Service Unavailable | Temporary outage |

### Error Codes

| Code | Description |
|------|-------------|
| `INVALID_REQUEST` | Request malformed or invalid |
| `AUTHENTICATION_REQUIRED` | Must authenticate |
| `INSUFFICIENT_PERMISSIONS` | Missing required scope |
| `RESOURCE_NOT_FOUND` | Requested resource doesn't exist |
| `VALIDATION_ERROR` | Input validation failed |
| `INSUFFICIENT_FUNDS` | Not enough balance |
| `INVESTMENT_UNAVAILABLE` | Project not accepting investments |
| `KYC_REQUIRED` | KYC verification required |
| `RATE_LIMIT_EXCEEDED` | Too many requests |

---

## API Endpoints

### Users

#### Get Current User

```
GET /v1/user/me
```

**Response:**
```json
{
  "data": {
    "id": "usr_abc123",
    "email": "investor@example.com",
    "name": "Jane Doe",
    "kyc_status": "verified",
    "kyc_verified_at": "2025-10-15T10:30:00Z",
    "created_at": "2025-09-01T14:22:00Z",
    "preferences": {
      "currency": "USD",
      "notifications": {
        "email": true,
        "sms": false
      }
    }
  }
}
```

#### Update User Profile

```
PATCH /v1/user/me
```

**Request:**
```json
{
  "name": "Jane Smith",
  "preferences": {
    "currency": "EUR"
  }
}
```

**Response:**
```json
{
  "data": {
    "id": "usr_abc123",
    "name": "Jane Smith",
    "preferences": {
      "currency": "EUR"
    }
  }
}
```

#### Get KYC Status

```
GET /v1/user/me/kyc
```

**Response:**
```json
{
  "data": {
    "status": "verified",
    "verified_at": "2025-10-15T10:30:00Z",
    "documents_required": [],
    "next_steps": []
  }
}
```

#### Initiate KYC

```
POST /v1/user/me/kyc
```

**Request:**
```json
{
  "provider": "onfido",
  "return_url": "https://yourapp.com/kyc/complete"
}
```

**Response:**
```json
{
  "data": {
    "verification_url": "https://verify.onfido.com/abc123",
    "applicant_id": "app_xyz789",
    "expires_at": "2025-11-16T10:30:00Z"
  }
}
```

---

### Projects

#### List Projects

```
GET /v1/projects
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `technology` | string | Filter by technology (solar, wind, hydro, storage, nuclear) |
| `country` | string | Filter by country code (US, UK, DE, etc.) |
| `stage` | string | Filter by stage (planning, construction, operating) |
| `min_return` | number | Minimum expected annual return (%) |
| `max_risk` | string | Maximum risk level (low, medium, high) |
| `search` | string | Search in name and description |
| `sort` | string | Sort by (newest, funded, rating, return) |
| `limit` | number | Results per page (max 100) |
| `cursor` | string | Pagination cursor |

**Example:**
```bash
GET /v1/projects?technology=solar&country=US&stage=operating&limit=20
```

**Response:**
```json
{
  "data": [
    {
      "id": "prj_sunrise_solar",
      "name": "Sunrise Solar Farm - Nevada",
      "description": "50 MW utility-scale solar installation",
      "technology": "solar",
      "capacity_mw": 50,
      "location": {
        "country": "US",
        "state": "NV",
        "city": "Las Vegas",
        "coordinates": {
          "lat": 36.1699,
          "lng": -115.1398
        }
      },
      "stage": "construction",
      "financial": {
        "target_amount": 2500000,
        "raised_amount": 1800000,
        "funding_percentage": 72,
        "min_investment": 10,
        "investor_count": 614,
        "expected_return_annual": 10.5,
        "total_return": 105,
        "payback_period_years": 10,
        "funding_deadline": "2025-12-15T23:59:59Z"
      },
      "impact": {
        "co2_avoided_tons_annual": 85000,
        "homes_powered": 12000,
        "jobs_created": 158
      },
      "rating": 4.8,
      "created_at": "2025-08-01T10:00:00Z"
    }
  ],
  "pagination": {
    "next_cursor": "eyJpZCI6MjB9",
    "has_more": true,
    "total": 1247
  }
}
```

#### Get Project

```
GET /v1/projects/{project_id}
```

**Response:**
```json
{
  "data": {
    "id": "prj_sunrise_solar",
    "name": "Sunrise Solar Farm - Nevada",
    "description": "50 MW utility-scale solar installation in Nevada desert",
    "technology": "solar",
    "capacity_mw": 50,
    "location": {
      "country": "US",
      "state": "NV",
      "city": "Las Vegas",
      "coordinates": {
        "lat": 36.1699,
        "lng": -115.1398
      }
    },
    "stage": "construction",
    "construction_progress": 60,
    "expected_cod": "2026-06-01",

    "financial": {
      "target_amount": 2500000,
      "raised_amount": 1800000,
      "funding_percentage": 72,
      "min_investment": 10,
      "max_investment": 100000,
      "investor_count": 614,
      "expected_return_annual": 10.5,
      "expected_return_total": 105,
      "payback_period_years": 10,
      "exit_timeline_years": 10,
      "funding_deadline": "2025-12-15T23:59:59Z"
    },

    "technical": {
      "panel_type": "Bifacial monocrystalline",
      "panel_manufacturer": "Longi Solar",
      "panel_capacity_w": 570,
      "panel_count": 87719,
      "inverter_type": "String inverters",
      "tracking": "Single-axis horizontal",
      "expected_generation_mwh_annual": 120000,
      "capacity_factor": 27.4,
      "degradation_annual": 0.45
    },

    "impact": {
      "co2_avoided_tons_annual": 85000,
      "homes_powered": 12000,
      "jobs_construction": 150,
      "jobs_operations": 8,
      "community_benefit_annual": 50000
    },

    "documents": [
      {
        "type": "prospectus",
        "name": "Project Prospectus.pdf",
        "url": "https://docs.terralumina.org/prj_sunrise_solar/prospectus.pdf",
        "size_bytes": 2458624,
        "uploaded_at": "2025-08-01T10:00:00Z"
      }
    ],

    "third_party_validation": [
      {
        "firm": "DNV GL Energy",
        "type": "technical_due_diligence",
        "conclusion": "Sound technical design with proven components",
        "date": "2025-07-15"
      }
    ],

    "rating": 4.8,
    "rating_breakdown": {
      "financial": 4.7,
      "technical": 4.9,
      "community": 4.8,
      "risk": 4.7,
      "values": 4.9
    },

    "created_at": "2025-08-01T10:00:00Z",
    "updated_at": "2025-11-10T14:22:00Z"
  }
}
```

#### Get Project Updates

```
GET /v1/projects/{project_id}/updates
```

**Response:**
```json
{
  "data": [
    {
      "id": "upd_abc123",
      "project_id": "prj_sunrise_solar",
      "title": "Construction Milestone: 60% Complete",
      "content": "Reached 60% construction completion...",
      "type": "progress",
      "published_at": "2025-11-10T09:00:00Z",
      "attachments": [
        {
          "type": "image",
          "url": "https://cdn.terralumina.org/updates/photo1.jpg"
        }
      ]
    }
  ],
  "pagination": {
    "next_cursor": null,
    "has_more": false,
    "total": 12
  }
}
```

#### Search Projects

```
GET /v1/projects/search
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `q` | string | Search query |
| `filters` | object | Filter criteria (technology, country, etc.) |

**Example:**
```bash
GET /v1/projects/search?q=solar+nevada&filters[technology]=solar&filters[country]=US
```

---

### Investments

#### List User Investments

```
GET /v1/investments
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `project_id` | string | Filter by project |
| `status` | string | Filter by status (pending, completed, failed) |
| `limit` | number | Results per page |
| `cursor` | string | Pagination cursor |

**Response:**
```json
{
  "data": [
    {
      "id": "inv_abc123",
      "user_id": "usr_xyz789",
      "project_id": "prj_sunrise_solar",
      "project_name": "Sunrise Solar Farm - Nevada",
      "amount": 500.00,
      "currency": "USD",
      "payment_method": "stripe",
      "status": "completed",
      "ownership_tokens": 192.3076923,
      "invested_at": "2025-10-20T15:30:00Z",
      "blockchain_tx_hash": "0x1234...",

      "current_value": 542.50,
      "return_to_date": 42.50,
      "return_percentage": 8.5
    }
  ],
  "pagination": {
    "next_cursor": null,
    "has_more": false,
    "total": 8
  }
}
```

#### Get Investment

```
GET /v1/investments/{investment_id}
```

**Response:**
```json
{
  "data": {
    "id": "inv_abc123",
    "user_id": "usr_xyz789",
    "project_id": "prj_sunrise_solar",
    "project_name": "Sunrise Solar Farm - Nevada",
    "amount": 500.00,
    "currency": "USD",
    "payment_method": "stripe",
    "payment_id": "pi_xyz123",
    "status": "completed",
    "ownership_tokens": 192.3076923,
    "invested_at": "2025-10-20T15:30:00Z",
    "blockchain_tx_hash": "0x1234567890abcdef...",

    "performance": {
      "current_value": 542.50,
      "return_to_date": 42.50,
      "return_percentage": 8.5,
      "distributions_received": 42.50,
      "distribution_count": 3
    },

    "distributions": [
      {
        "id": "dist_q3_2025",
        "amount": 15.75,
        "distribution_date": "2025-10-01",
        "claimed": true,
        "claimed_at": "2025-10-02T10:15:00Z"
      }
    ]
  }
}
```

#### Create Investment

```
POST /v1/investments
```

**Request:**
```json
{
  "project_id": "prj_sunrise_solar",
  "amount": 500.00,
  "currency": "USD",
  "payment_method": "stripe",
  "payment_source": "pm_card_visa"
}
```

**Response:**
```json
{
  "data": {
    "id": "inv_new123",
    "project_id": "prj_sunrise_solar",
    "amount": 500.00,
    "status": "pending",
    "payment_intent_id": "pi_abc123",
    "payment_client_secret": "pi_abc123_secret_xyz",

    "next_action": {
      "type": "complete_payment",
      "redirect_url": "https://checkout.stripe.com/..."
    }
  }
}
```

---

### Portfolio

#### Get Portfolio Summary

```
GET /v1/portfolio
```

**Response:**
```json
{
  "data": {
    "total_invested": 5000.00,
    "current_value": 5425.00,
    "total_return": 425.00,
    "return_percentage": 8.5,
    "distributions_received": 425.00,
    "investment_count": 8,
    "project_count": 6,

    "breakdown_by_technology": {
      "solar": { "amount": 2500, "percentage": 50 },
      "wind": { "amount": 1500, "percentage": 30 },
      "hydro": { "amount": 1000, "percentage": 20 }
    },

    "breakdown_by_country": {
      "US": { "amount": 3000, "percentage": 60 },
      "UK": { "amount": 1500, "percentage": 30 },
      "DE": { "amount": 500, "percentage": 10 }
    },

    "breakdown_by_stage": {
      "operating": { "amount": 3000, "percentage": 60 },
      "construction": { "amount": 1500, "percentage": 30 },
      "planning": { "amount": 500, "percentage": 10 }
    },

    "top_investments": [
      {
        "project_id": "prj_sunrise_solar",
        "project_name": "Sunrise Solar Farm - Nevada",
        "amount": 1000,
        "current_value": 1085,
        "return": 85,
        "return_percentage": 8.5
      }
    ]
  }
}
```

#### Get Portfolio Performance

```
GET /v1/portfolio/performance
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `period` | string | Time period (1m, 3m, 6m, 1y, all) |
| `granularity` | string | Data granularity (daily, weekly, monthly) |

**Response:**
```json
{
  "data": {
    "period": "1y",
    "granularity": "monthly",
    "data_points": [
      {
        "date": "2024-11-01",
        "total_invested": 5000,
        "portfolio_value": 5000,
        "return": 0,
        "return_percentage": 0
      },
      {
        "date": "2024-12-01",
        "total_invested": 5000,
        "portfolio_value": 5035,
        "return": 35,
        "return_percentage": 0.7
      }
    ],

    "summary": {
      "starting_value": 5000,
      "ending_value": 5425,
      "total_return": 425,
      "return_percentage": 8.5,
      "annualized_return": 8.2
    }
  }
}
```

---

### Distributions

#### List Distributions

```
GET /v1/distributions
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `project_id` | string | Filter by project |
| `claimed` | boolean | Filter by claim status |
| `limit` | number | Results per page |

**Response:**
```json
{
  "data": [
    {
      "id": "dist_q3_2025_prj_sunrise",
      "project_id": "prj_sunrise_solar",
      "project_name": "Sunrise Solar Farm - Nevada",
      "distribution_date": "2025-10-01",
      "total_amount_project": 285000,
      "user_amount": 15.75,
      "currency": "USD",
      "distribution_type": "quarterly",
      "claimed": true,
      "claimed_at": "2025-10-02T10:15:00Z",
      "payment_method": "bank_transfer",
      "payment_reference": "TL-DIST-Q3-2025-123"
    }
  ],
  "pagination": {
    "next_cursor": null,
    "has_more": false,
    "total": 12
  }
}
```

#### Claim Distribution

```
POST /v1/distributions/{distribution_id}/claim
```

**Request:**
```json
{
  "payment_method": "bank_transfer"
}
```

**Response:**
```json
{
  "data": {
    "id": "dist_q3_2025_prj_sunrise",
    "amount": 15.75,
    "claimed": true,
    "claimed_at": "2025-11-15T14:30:00Z",
    "expected_transfer_date": "2025-11-18",
    "payment_reference": "TL-DIST-Q3-2025-456"
  }
}
```

---

## WebSocket API

### Connection

```javascript
const ws = new WebSocket('wss://api.terralumina.org/v1/ws');

// Authenticate
ws.send(JSON.stringify({
  type: 'auth',
  token: 'YOUR_ACCESS_TOKEN'
}));

// Listen for messages
ws.onmessage = (event) => {
  const data = JSON.parse(event.data);
  console.log(data);
};
```

### Subscribe to Portfolio Updates

```javascript
ws.send(JSON.stringify({
  type: 'subscribe',
  channel: 'portfolio'
}));

// Receive updates
{
  "type": "portfolio_update",
  "data": {
    "total_value": 5430.25,
    "total_return": 430.25,
    "return_percentage": 8.6
  }
}
```

### Subscribe to Project Updates

```javascript
ws.send(JSON.stringify({
  type: 'subscribe',
  channel: 'project',
  project_id: 'prj_sunrise_solar'
}));

// Receive updates
{
  "type": "project_update",
  "data": {
    "project_id": "prj_sunrise_solar",
    "update_type": "funding_milestone",
    "funding_percentage": 75
  }
}
```

---

## Webhooks

Configure webhooks to receive real-time notifications.

### Setup

1. Go to [terralumina.org/developers/webhooks](https://terralumina.org/developers/webhooks)
2. Add webhook URL
3. Select events to receive
4. Save webhook secret for verification

### Events

| Event | Description |
|-------|-------------|
| `investment.created` | New investment created |
| `investment.completed` | Investment completed successfully |
| `distribution.available` | New distribution available to claim |
| `distribution.claimed` | Distribution claimed |
| `project.funded` | Project reached funding goal |
| `project.update` | New project update posted |

### Webhook Payload

```json
{
  "id": "evt_abc123",
  "type": "investment.completed",
  "created_at": "2025-11-15T14:30:00Z",
  "data": {
    "investment_id": "inv_xyz789",
    "project_id": "prj_sunrise_solar",
    "amount": 500.00,
    "user_id": "usr_abc123"
  }
}
```

### Verifying Webhooks

```python
import hmac
import hashlib

def verify_webhook(payload, signature, secret):
    expected = hmac.new(
        secret.encode(),
        payload.encode(),
        hashlib.sha256
    ).hexdigest()

    return hmac.compare_digest(expected, signature)

# Usage
signature = request.headers.get('X-TerraLumina-Signature')
is_valid = verify_webhook(request.body, signature, WEBHOOK_SECRET)
```

---

## Client Libraries

### Python

```bash
pip install terra-lumina
```

```python
from terra_lumina import TerraLumina

# Initialize
client = TerraLumina(api_key='your_api_key')

# List projects
projects = client.projects.list(technology='solar', country='US')

for project in projects:
    print(f"{project.name}: {project.funding_percentage}% funded")

# Create investment
investment = client.investments.create(
    project_id='prj_sunrise_solar',
    amount=500.00
)

print(f"Invested ${investment.amount} in {investment.project_name}")

# Get portfolio
portfolio = client.portfolio.get()
print(f"Total return: {portfolio.return_percentage}%")
```

### JavaScript/TypeScript

```bash
npm install @terra-lumina/sdk
```

```typescript
import { TerraLumina } from '@terra-lumina/sdk';

// Initialize
const client = new TerraLumina({ apiKey: 'your_api_key' });

// List projects
const projects = await client.projects.list({
  technology: 'solar',
  country: 'US'
});

// Create investment
const investment = await client.investments.create({
  projectId: 'prj_sunrise_solar',
  amount: 500.00
});

// Get portfolio
const portfolio = await client.portfolio.get();
console.log(`Total return: ${portfolio.returnPercentage}%`);
```

---

## OpenAPI Specification

Full OpenAPI 3.0 specification available at:

```
https://api.terralumina.org/v1/openapi.json
```

Import into:
- Postman
- Insomnia
- Swagger UI
- API testing tools

---

## Sandbox Environment

Test API integration in sandbox mode:

**Base URL:**
```
https://sandbox-api.terralumina.org/v1
```

**Features:**
- Separate test data
- No real money transactions
- Unlimited API calls
- Reset data anytime

**Get sandbox credentials:**

Visit [terralumina.org/developers/sandbox](https://terralumina.org/developers/sandbox)

---

## Support

**API Support:**

- 📖 [Interactive API Explorer](https://api.terralumina.org/docs)
- 💬 [Developer Discord](https://discord.gg/terralumina) - #api channel
- 📧 api@luminousdynamics.org
- 🐛 [Report API Issues](https://github.com/Luminous-Dynamics/terra-lumina/issues)

**Office Hours:**

Every Tuesday 2-3 PM PT - Join us on Discord for live API help

---

*\"Build the future of renewable energy investment with our API.\"* 🌍💚

*Last updated: November 15, 2025*

[Back to Terra Lumina Docs](index.md) | [API Explorer](https://api.terralumina.org/docs)
