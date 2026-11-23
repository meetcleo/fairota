# Fairota

> Rotations done fair

## Running locally

```bash
$ gem install foreman
```

```bash
$ foreman start -f Procfile.dev
```

## Sign in

The app uses Okta for sign in. It needs these env vars:

- `OKTA_ISSUER`, for example `https://<org>.okta.com`
- `OKTA_CLIENT_ID` and `OKTA_CLIENT_SECRET` from the Okta app
- `OKTA_REDIRECT_URI`, which defaults to `http://localhost:3000/auth/okta/callback`
