Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C91432988A
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 10:50:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A91513C6E5B
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 10:50:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 899003C56C2
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 10:50:44 +0100 (CET)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2DCFD1000A6C
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 10:50:44 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id do6so34066318ejc.3
 for <ltp@lists.linux.it>; Tue, 02 Mar 2021 01:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5hxO8geRKHzNtxA9y8z7MoBEUJzs0Nb88tjxqpIWGmE=;
 b=ntP+ugCJeq/Nswd5B80CT/rGJ7OiG/heEnQUO+CvJ8S5nzSAB0Jjv7gbFPKtQFdtgY
 UGkA1r/XS8UmHNHg1+UBJdB2/rI/+SFu+hwskOhJuV0rKRHSZ9YddwrZqj/N9sAzLFnd
 b+mP/HypjVWLhrP9oImLXl8op+D5xCo2qV4x8h31Z57APSxsEO3MTikg+gHyn0AicN8T
 cV98ROiUZv0tUBZxpAZwtOx/yfmprwtiFb9VP3Wv8rNLTbzD5JnBqSa7VOc/P1e4oMSi
 fBqn4sucdXrg0qXBQlMulbzrw2o5pxkZ0kYVa6V/Ta21olXTsob+BUurnnV1pHlvvIq5
 v+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5hxO8geRKHzNtxA9y8z7MoBEUJzs0Nb88tjxqpIWGmE=;
 b=ias97x+6f8XFgSdtPYl1Fl6IlZqQHe1TlKRGsvPHeg3hKkXrd6SlDXGkWGaff8YJQF
 3ZFDguKQ/eNHGVOH0g9wjJKjIR0hfyyd5v7RPcaijLvfarwQNI53REkIN+NJM84yGJ41
 Ix118bw0eH3FKXbFc/que8hyFei+iMw7DdlDuxhAr7nF+I9ncJ5/imjrMRB1jVh1M+W5
 UIEFi1WtYIE99NldmuHBTpplQLG0ESS27Tj14vXxT6B8hcmB1biJ5uvzARdZbs3iYmU3
 kQ/3CNEKQ/pQPcuhQc+mot90vpthxh6q5mHnEGzlRjboKK/JBN8H7Ag/kLxSnkqD8Sxg
 01Ww==
X-Gm-Message-State: AOAM531hnieQVzJqBGF0Ch2n0fWRmQMrzl0CRaBvHy29NimWdPZ5jJLK
 iG5j/on+PFUnDEEw6XxCjFSmreC5mXMGxuDMwqJkHg==
X-Google-Smtp-Source: ABdhPJzzRBsP3yJj7bEN/TJZ8X9qd/bTeDJ0LE+/H87gPbR1wkDmLEE25vLUJaPk0WmkiFVMQSEslUMSynFO1/qPjVU=
X-Received: by 2002:a17:906:444d:: with SMTP id
 i13mr19536087ejp.170.1614678643555; 
 Tue, 02 Mar 2021 01:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20210301193642.707301430@linuxfoundation.org>
 <CA+G9fYuK0k0FsnSk4egKOO=B0pV80bjp+f5E-0xPOfbPugQPxg@mail.gmail.com>
In-Reply-To: <CA+G9fYuK0k0FsnSk4egKOO=B0pV80bjp+f5E-0xPOfbPugQPxg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 2 Mar 2021 15:20:32 +0530
Message-ID: <CA+G9fYsivUPRRQgMXpnA_XdXH8i2wx_DPH70t+6OzHkjOaswrg@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.10 000/661] 5.10.20-rc2 review
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 pavel@denx.de, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-stable <stable@vger.kernel.org>,
 patches@kernelci.org, Jiri Slaby <jirislaby@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgR3JlZyBhbmQgTGludXMsCgpPbiBUdWUsIDIgTWFyIDIwMjEgYXQgMTI6NDUsIE5hcmVzaCBL
YW1ib2p1IDxuYXJlc2gua2FtYm9qdUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgMiBN
YXIgMjAyMSBhdCAwMToyMSwgR3JlZyBLcm9haC1IYXJ0bWFuCj4gPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPiB3cm90ZToKPiA+Cj4gPiBUaGlzIGlzIHRoZSBzdGFydCBvZiB0aGUgc3RhYmxl
IHJldmlldyBjeWNsZSBmb3IgdGhlIDUuMTAuMjAgcmVsZWFzZS4KPiA+IFRoZXJlIGFyZSA2NjEg
cGF0Y2hlcyBpbiB0aGlzIHNlcmllcywgYWxsIHdpbGwgYmUgcG9zdGVkIGFzIGEgcmVzcG9uc2UK
PiA+IHRvIHRoaXMgb25lLiAgSWYgYW55b25lIGhhcyBhbnkgaXNzdWVzIHdpdGggdGhlc2UgYmVp
bmcgYXBwbGllZCwgcGxlYXNlCj4gPiBsZXQgbWUga25vdy4KPiA+Cj4gPiBSZXNwb25zZXMgc2hv
dWxkIGJlIG1hZGUgYnkgV2VkLCAwMyBNYXIgMjAyMSAxOTozNDo1MyArMDAwMC4KPiA+IEFueXRo
aW5nIHJlY2VpdmVkIGFmdGVyIHRoYXQgdGltZSBtaWdodCBiZSB0b28gbGF0ZS4KPiA+Cj4gPiBU
aGUgd2hvbGUgcGF0Y2ggc2VyaWVzIGNhbiBiZSBmb3VuZCBpbiBvbmUgcGF0Y2ggYXQ6Cj4gPiAg
ICAgICAgIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5lbC92NS54L3N0YWJs
ZS1yZXZpZXcvcGF0Y2gtNS4xMC4yMC1yYzIuZ3oKPiA+IG9yIGluIHRoZSBnaXQgdHJlZSBhbmQg
YnJhbmNoIGF0Ogo+ID4gICAgICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQgbGludXgtNS4xMC55Cj4gPiBh
bmQgdGhlIGRpZmZzdGF0IGNhbiBiZSBmb3VuZCBiZWxvdy4KPiA+Cj4gPiB0aGFua3MsCj4gPgo+
ID4gZ3JlZyBrLWgKPgo+Cj4gUmVzdWx0cyBmcm9tIExpbmFyb+KAmXMgdGVzdCBmYXJtLgo+IFJl
Z3Jlc3Npb25zIGRldGVjdGVkIG9uIGFsbCBkZXZpY2VzIChhcm02NCwgYXJtLCB4ODZfNjQgYW5k
IGkzODYpLgo+Cj4gaGFuZ3VwMDEgICAgMSAgVEZBSUwgIDogIGhhbmd1cDAxLmM6MTMzOiB1bmV4
cGVjdGVkIG1lc3NhZ2UgMwo+Cj4gVGhpcyBmYWlsdXJlIGlzIHNwZWNpZmljIHRvIHN0YWJsZS1y
YyA1LjEwIGFuZCA1LjExLgo+IFRlc3QgUEFTUyBvbiBtYWlubGluZSBhbmQgTGludXggbmV4dCBr
ZXJuZWwuCj4KCkkgaGF2ZSByZXZlcnRlZCB0aGVzZSB0d28gcGF0Y2hlcyBhbmQgdGhlIHRlc3Qg
Y2FzZSBnb3QgUEFTUwpvbiBMaW51eCB2ZXJzaW9uIDUuMTAuMjAtcmMyLgoKaGFuZ3VwMDEgMSBU
UEFTUyA6IGNoaWxkIHByb2Nlc3MgZXhpdGVkIHdpdGggc3RhdHVzIDAKCiAgIExpbnVzIFRvcnZh
bGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KICAgICAgIHR0eTogaW1wbGVtZW50
IHJlYWRfaXRlcgoKICAgTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24u
b3JnPgogICAgICAgdHR5OiBjb252ZXJ0IHR0eV9sZGlzY19vcHMgJ3JlYWQoKScgZnVuY3Rpb24g
dG8gdGFrZSBhIGtlcm5lbCBwb2ludGVyCgpyZWY6Cmh0dHBzOi8vbGtmdC52YWxpZGF0aW9uLmxp
bmFyby5vcmcvc2NoZWR1bGVyL2pvYi8yMzMwNTQ5I0wxNjY3Cmh0dHBzOi8vbGtmdC52YWxpZGF0
aW9uLmxpbmFyby5vcmcvc2NoZWR1bGVyL2pvYi8yMzMwNTUwI0wxMjAyCgotIE5hcmVzaAoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
