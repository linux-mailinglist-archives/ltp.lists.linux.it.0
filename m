Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AC02D737
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 10:04:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B6E13EA1D3
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 10:04:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0262D3EA137
 for <ltp@lists.linux.it>; Wed, 29 May 2019 10:04:54 +0200 (CEST)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 360DF201343
 for <ltp@lists.linux.it>; Wed, 29 May 2019 10:04:54 +0200 (CEST)
Received: by mail-lf1-x141.google.com with SMTP id m14so1211597lfp.12
 for <ltp@lists.linux.it>; Wed, 29 May 2019 01:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1LIOku9W0w6jyilHULXZM0qJLovMNSsThL0PJAa4R6s=;
 b=cChtVJTAkdUeB569BzFxW+lkBv7RfvyARS1+90S3q0TPpHzTNLxCWGjgwut75/WYHZ
 CQ9XfGod9nJpU5BjcSlJyGmMzlSkH569SwBTcbB9Hg7jZTwZdfOfeeWP2oc2MJKZwMiW
 kYz9kLS/NVsgGustKQHks5T0k1EOf3OwfcwoMTZIn5LIJ2h3oDzvilSVIOJpzqUHD0Qh
 Io1B9qE1nYXUFSIBylfBsvLgZBYmIByUJzMPyFR56uHECQLCJrdIXEG5oXM+wrtyqdBn
 NwWeexMTd9waVGwrIeFxp/jE71lcpq9O9JeJ+tRcfj+6BXyU9vzfBWUuEJbO9nKdDTIX
 pmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1LIOku9W0w6jyilHULXZM0qJLovMNSsThL0PJAa4R6s=;
 b=SAS+Ea8GVCG/4wDToB5Vl4Dl6+UdzF9qtQ0SQ1VifPpps1obMicBmniYyco9I2SvZl
 RqjusPMtoEF6o/GRLpsDlxGw8CHpjLnSjZPLKT21QLsAcy0VoKvtJGSVeW9lH3cksIGa
 frUYhYhy2gdTNE2oaVsDKBhnz4/rwQwO9jcVsztsSQa/IXIi6pKn9BIoudyCaF7sbuWT
 QOhKK8fCBgKyxpxPR5T6lG1WxszpW2K6rAAxA/wZtA0G1y0PYyspuwa1Jd1CamnrvWwd
 zHYAlWwklE+IKUinn6S/NwkpWm92lCbC+CK0RvoErognY7HliGo8JdbNtRMKx7Hgq1Lb
 Ts8g==
X-Gm-Message-State: APjAAAWaCsgr6FnM7HxNpqJ8MAGivotkrZFBgPfu2wFF+ufpRsRMaZ12
 nWZdKtgI/WJHxYXklX0yOeimegY9L8ATBd+Wa+TmnA==
X-Google-Smtp-Source: APXvYqzGg3PfDli6WYmdX+mVXkhECaeIUHXaK/vTD7ZvztMnsVmqR0e2YR/cufgv/gQgmROlPOEQ02URCK8zPU2nObI=
X-Received: by 2002:ac2:4428:: with SMTP id w8mr3070736lfl.99.1559117093345;
 Wed, 29 May 2019 01:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190529025256.GB22325@shao2-debian>
 <20190529035613.GA6210@mit.edu>
In-Reply-To: <20190529035613.GA6210@mit.edu>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 29 May 2019 13:34:42 +0530
Message-ID: <CA+G9fYtVH0UF55Xins22sXCvcOLN+JGv-p2brj58BjzNGqdE2A@mail.gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>, kernel test robot <rong.a.chen@intel.com>,
 Jan Kara <jack@suse.cz>, 
 Ira Weiny <ira.weiny@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, lkp@01.org, ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: lkft-triage@lists.linaro.org
Subject: Re: [LTP] [LKP] [ext4] 079f9927c7: ltp.mmap16.fail
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgVGVkLAoKT24gV2VkLCAyOSBNYXkgMjAxOSBhdCAwOToyNiwgVGhlb2RvcmUgVHMnbyA8dHl0
c29AbWl0LmVkdT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAyOSwgMjAxOSBhdCAxMDo1Mjo1NkFN
ICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90ZToKPiA+IEZZSSwgd2Ugbm90aWNlZCB0aGUg
Zm9sbG93aW5nIGNvbW1pdCAoYnVpbHQgd2l0aCBnY2MtNyk6Cj4gPgo+ID4gY29tbWl0OiAwNzlm
OTkyN2M3YmZhMDI2ZDk2M2RiMTQ1NTE5NzE1OWViZTViNTM0ICgiZXh0NDogZ3JhY2VmdWxseSBo
YW5kbGUgZXh0NF9icmVha19sYXlvdXRzKCkgZmFpbHVyZSBkdXJpbmcgdHJ1bmNhdGUiKQo+ID4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1u
ZXh0LmdpdCBtYXN0ZXIKCkkgZG8gaGF2ZSBmb3VuZCB0aGlzIHByb2JsZW0gb24gbGludXggbmV4
dCAyMDE5MDUyOCBvbiB4ODZfNjQsIGkzODYsCmFybTY0IGFuZCBhcm0gYXJjaGl0ZWN0dXJlcy4K
QnV0LCB0aGlzIGZhaWx1cmUgaXMgbm90IGVhc3kgdG8gcmVwcm9kdWNlLgpzbyB0aG91Z2h0IG9m
IHNoYXJpbmcgcmVwb3J0IHdpdGggc3RlcHMgdG8gcmVwcm9kdWNlIGFuZCBnb3QgZGVsYXllZC4K
Cj4KPiBKYW4gLS0tIHRoaXMgaXMgdGhlIG9sZCB2ZXJzaW9uIG9mIHlvdXIgcGF0Y2gsIHdoaWNo
IEkgaGFkIGRyb3BwZWQKPiBiZWZvcmUgc2VuZGluZyBhIHB1c2ggcmVxdWVzdCB0byBMaW51cy4g
IEhvd2V2ZXIsIEkgZm9yZ290IHRvIHJlc2V0Cj4gdGhlIGRldiBicmFuY2ggc28gaXQgc3RpbGwg
aGFkIHRoZSBvbGQgcGF0Y2ggb24gaXQsIGFuZCBzbyBpdCBnb3QKPiBwaWNrZWQgdXAgaW4gbGlu
dXgtbmV4dC4gIEFwb2xvZ2llcyBmb3IgdGhlIGNvbmZ1c2lvbi4KPgo+IEkndmUgcmVzZXQgdGhl
IGRldiBicmFuY2ggb24gZXh0NC5naXQsIGFuZCB0aGUgbmV3IHZlcnNpb24gb2YgeW91cgo+IHBh
dGNoIHdpbGwgc2hvdyB1cCB0aGVyZSBzaG9ydGx5LCBhcyBJIHN0YXJ0IHJldmlld2luZyBwYXRj
aGVzIGZvciB0aGUKPiBuZXh0IG1lcmdlIHdpbmRvdy4KCkhvd2V2ZXIsIFRoYW5rcyBmb3IgbG9v
a2luZyBpbnRvIHRoaXMgcHJvYmxlbS4KSSB3aWxsIGtlZXAgbW9uaXRvcmluZyB0aGlzIG1tYXAx
NiBmYWlsdXJlIGFuZCBsZXQgeW91IGtub3cgd2hlbiBpdAp3aWxsIGdldCBmaXhlZC4KCi0gTmFy
ZXNoCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
