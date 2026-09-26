interface VerificationEmailTemplateInput {
  verificationUrl: string;
}

export function getVerificationEmailTemplate({
  verificationUrl,
}: VerificationEmailTemplateInput) {
  return {
    subject: "Verify your Gwent Forge email address",

    html: `
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="UTF-8" />
          <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0"
          />
          <meta name="color-scheme" content="dark" />
          <meta name="supported-color-schemes" content="dark" />

          <title>Verify your Gwent Forge email address</title>
        </head>

        <body
          style="
            margin: 0;
            padding: 0;
            background-color: #020617;
            font-family: Arial, Helvetica, sans-serif;
            color: #e2e8f0;
          "
        >
          <table
            role="presentation"
            width="100%"
            cellspacing="0"
            cellpadding="0"
            border="0"
            style="
              width: 100%;
              margin: 0;
              padding: 0;
              background-color: #020617;
            "
          >
            <tr>
              <td
                align="center"
                style="
                  padding: 40px 16px;
                "
              >
                <table
                  role="presentation"
                  width="100%"
                  cellspacing="0"
                  cellpadding="0"
                  border="0"
                  style="
                    width: 100%;
                    max-width: 560px;
                    margin: 0 auto;
                  "
                >
                  <!-- BRAND -->
                  <tr>
                    <td
                      align="center"
                      style="
                        padding: 0 0 24px;
                      "
                    >
                      <div
                        style="
                          font-family: Georgia, 'Times New Roman', serif;
                          font-size: 28px;
                          font-weight: bold;
                          letter-spacing: 1px;
                          color: #fbbf24;
                        "
                      >
                        Gwent Forge
                      </div>

                      <div
                        style="
                          margin-top: 6px;
                          font-size: 12px;
                          letter-spacing: 2px;
                          text-transform: uppercase;
                          color: #64748b;
                        "
                      >
                        Less Setup, More Gwent.
                      </div>
                    </td>
                  </tr>

                  <!-- CARD -->
                  <tr>
                    <td
                      style="
                        background-color: #0f172a;
                        border: 1px solid #334155;
                        border-radius: 16px;
                        padding: 20px 32px;
                      "
                    >
                      <!-- HEADING -->
                      <h1
                        style="
                          margin: 28px 0 0;
                          text-align: center;
                          font-family: Georgia, 'Times New Roman', serif;
                          font-size: 28px;
                          line-height: 1.3;
                          font-weight: bold;
                          color: #fbbf24;
                        "
                      >
                        Verify your email address
                      </h1>

                      <!-- MESSAGE -->
                      <p
                        style="
                          margin: 20px 0 0;
                          text-align: center;
                          font-size: 16px;
                          line-height: 1.7;
                          color: #cbd5e1;
                        "
                      >
                        Thank you for creating your Gwent Forge account.
                        Please verify your email address to complete your
                        registration.
                      </p>

                      <!-- BUTTON -->
                      <table
                        role="presentation"
                        cellspacing="0"
                        cellpadding="0"
                        border="0"
                        align="center"
                        style="
                          margin: 32px auto 0;
                        "
                      >
                        <tr>
                          <td
                            align="center"
                            style="
                              border-radius: 8px;
                              background-color: #fbbf24;
                            "
                          >
                            <a
                              href="${verificationUrl}"
                              target="_blank"
                              style="
                                display: inline-block;
                                padding: 14px 28px;
                                border-radius: 8px;
                                background-color: #fbbf24;
                                color: #020617;
                                font-size: 16px;
                                line-height: 1.2;
                                font-weight: bold;
                                text-decoration: none;
                              "
                            >
                              Verify email address
                            </a>
                          </td>
                        </tr>
                      </table>

                      <!-- EXPIRATION -->
                      <p
                        style="
                          margin: 28px 0 0;
                          text-align: center;
                          font-size: 13px;
                          line-height: 1.6;
                          color: #94a3b8;
                        "
                      >
                        This verification link will expire after a limited
                        time.
                      </p>

                      <!-- FALLBACK LINK -->
                      <div
                        style="
                          margin-top: 28px;
                          padding-top: 24px;
                          border-top: 1px solid #334155;
                        "
                      >
                        <p
                          style="
                            margin: 0;
                            font-size: 12px;
                            line-height: 1.6;
                            color: #64748b;
                          "
                        >
                          If the button above does not work, copy and paste
                          the following link into your browser:
                        </p>

                        <p
                          style="
                            margin: 8px 0 0;
                            font-size: 12px;
                            line-height: 1.6;
                            word-break: break-all;
                          "
                        >
                          <a
                            href="${verificationUrl}"
                            target="_blank"
                            style="
                              color: #fbbf24;
                              text-decoration: underline;
                            "
                          >
                            ${verificationUrl}
                          </a>
                        </p>
                      </div>
                    </td>
                  </tr>

                  <!-- FOOTER -->
                  <tr>
                    <td
                      align="center"
                      style="
                        padding: 24px 16px 0;
                      "
                    >
                      <p
                        style="
                          margin: 0;
                          font-size: 12px;
                          line-height: 1.6;
                          color: #475569;
                        "
                      >
                        You received this email because an account was
                        registered with this email address.
                      </p>

                      <p
                        style="
                          margin: 8px 0 0;
                          font-size: 12px;
                          color: #334155;
                        "
                      >
                        &copy; ${new Date().getFullYear()} Gwent Forge
                      </p>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </body>
      </html>
    `,
  };
}
