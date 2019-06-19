Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 428464B1B3
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 07:53:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF9D83EA8B0
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 07:53:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B5EB23EA2FD
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 07:53:37 +0200 (CEST)
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E662E600820
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 07:53:36 +0200 (CEST)
Received: by mail-yb1-xb43.google.com with SMTP id 189so1827258ybh.4
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 22:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v4aDj0Sf3t6iEmKrkbh+HDKGGnJOPE8vyawQ4PJzUVE=;
 b=oevGuul7+cTeClquPqIcIt6w5n89sYYB60gZF4i2zKnc/FXSFMiVb8LSjrrhJPbByo
 v69MfU9JGgk7HGJXrcCyvrDFt+e30EJZDJ4eYJ2Q54aeHMCUgzxQzYuX1oS5qJR32LJi
 BOdV4a4NceIIwA/0S0AXlL1N8YNrXV0RENH8LtzARtJYqirLSCOhagcoDsDGw3Z/zkQ6
 FUQ1iRogDlTRdyi4LBK5wR3jIQsNtXeDRGtk0awtyyNJb3b3HCH6eauEwmsHeikMA39B
 MPTeMc3g0sO4C+XEQ1+hSHBlAIbLasEoL0qqgs4c7UzaIX3S+4hce0tU2Uw6NK3npYQp
 PC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4aDj0Sf3t6iEmKrkbh+HDKGGnJOPE8vyawQ4PJzUVE=;
 b=knmdeJaNWXRswr72e3C78yeh2byJPWcyiPHO0qkOe3czG5bhfHMcB17qHTP/de9amO
 Aet1zZsM/wae4Hw2D7EsyNdAcADLQnZYKaJMmVKhC0OyUD8/zYdZ93VIvmSXcKAFdMnO
 o3a0f4L/YwrrQRHXsUhXfZML5OiGBSaXxiRjIbRV8/GCqs5m6eiNNRa2czvH0tR7x6e6
 KcsQYhh9L9408zUIsLXolrmP2CQG6tw1rE/lyDOyYu0q9ud6I6q6xiXtrj7xiSXL1Zj+
 pt7tgO8lNMZtST0r/gHBMrupQKWfoR5VtAGqRlcjK5JgZMQ4UnnYHsbneFC602/ewY/g
 Y6dw==
X-Gm-Message-State: APjAAAVydBChrVzePDOYeg2xEbhSJs9+6A/e3Zml14olNvVaZhq5Kplt
 /gsQOvHh1bz+70eIBJyD8rrIFTYWwSbPmnOwRjM=
X-Google-Smtp-Source: APXvYqzRrJ8OS/YX1hsPlEoNyVBfYOd51gClv2/88VHo1TViOJ1b1Z51NJzmeG1TEPs7SUUN3ssVjn3mIjRMhGCu86g=
X-Received: by 2002:a25:d946:: with SMTP id q67mr58631403ybg.126.1560923615745; 
 Tue, 18 Jun 2019 22:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560766652.git.mbobrowski@mbobrowski.org>
 <6c25395422b19d2a4e2c66937afcaa767b83e776.1560766652.git.mbobrowski@mbobrowski.org>
 <CAOQ4uxgzA83i=rdQX+076_vZ2LE0Vihv1Fc0MXyXS4r-U4a93Q@mail.gmail.com>
 <20190619023512.GA25967@neo>
In-Reply-To: <20190619023512.GA25967@neo>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 19 Jun 2019 08:53:24 +0300
Message-ID: <CAOQ4uxigbOcdr9fV++1EmOF4s-isfdCPq0M_YMHaF=gu8EAF5A@mail.gmail.com>
To: Matthew Bobrowski <mbobrowski@mbobrowski.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v4 1/3] syscalls/fanotify13: new test to verify
 FAN_REPORT_FID functionality
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

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgNTozNSBBTSBNYXR0aGV3IEJvYnJvd3NraQo8bWJvYnJv
d3NraUBtYm9icm93c2tpLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAx
MjoyMzozNEFNICswMzAwLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPiA+ID4gK3N0YXRpYyB2b2lk
IGRvX3Rlc3QodW5zaWduZWQgaW50IG51bWJlcikKPiA+ID4gK3sKPiA+ID4gKyAgICAgICB1bnNp
Z25lZCBpbnQgaTsKPiA+ID4gKyAgICAgICBpbnQgbGVuLCBmZHNbQVJSQVlfU0laRShvYmplY3Rz
KV07Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBzdHJ1Y3QgZmlsZV9oYW5kbGUgKmV2ZW50X2ZpbGVf
aGFuZGxlOwo+ID4gPiArICAgICAgIHN0cnVjdCBmYW5vdGlmeV9ldmVudF9tZXRhZGF0YSAqbWV0
YWRhdGE7Cj4gPiA+ICsgICAgICAgc3RydWN0IGZhbm90aWZ5X2V2ZW50X2luZm9fZmlkICpldmVu
dF9maWQ7Cj4gPiA+ICsgICAgICAgc3RydWN0IHRlc3RfY2FzZV90ICp0YyA9ICZ0ZXN0X2Nhc2Vz
W251bWJlcl07Cj4gPiA+ICsgICAgICAgc3RydWN0IGZhbm90aWZ5X21hcmtfdHlwZSAqbWFyayA9
ICZ0Yy0+bWFyazsKPiA+ID4gKwo+ID4gPiArICAgICAgIHRzdF9yZXMoVElORk8sCj4gPiA+ICsg
ICAgICAgICAgICAgICAiVGVzdCAjJWQ6IEZBTl9SRVBPUlRfRklEIHdpdGggbWFyayBmbGFnOiAl
cyIsCj4gPiA+ICsgICAgICAgICAgICAgICBudW1iZXIsIG1hcmstPm5hbWUpOwo+ID4gPiArCj4g
PiA+ICsgICAgICAgZmFub3RpZnlfZmQgPSBmYW5vdGlmeV9pbml0KEZBTl9DTEFTU19OT1RJRiB8
IEZBTl9SRVBPUlRfRklELCBPX1JET05MWSk7Cj4gPiA+ICsgICAgICAgaWYgKGZhbm90aWZ5X2Zk
ID09IC0xKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoZXJybm8gPT0gRUlOVkFMKSB7Cj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHRzdF9yZXMoVENPTkYsCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIkZBTl9SRVBPUlRfRklEIG5vdCBzdXBwb3J0ZWQgYnkg
a2VybmVsIik7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gKyAg
ICAgICAgICAgICAgIH0KPiA+ID4gKyAgICAgICAgICAgICAgIHRzdF9icmsoVEJST0sgfCBURVJS
Tk8sCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICJmYW5vdGlmeV9pbml0KEZBTl9DTEFT
U19OT1RJRiB8IEZBTl9SRVBPUlRfRklELCAiCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICJPX1JET05MWSkgZmFpbGVkIik7Cj4gPiA+ICsgICAgICAgfQo+ID4gPiArCj4gPiA+ICsgICAg
ICAgLyogUGxhY2UgbWFya3Mgb24gYSBzZXQgb2Ygb2JqZWN0cyBhbmQgc2V0dXAgdGhlIGV4cGVj
dGVkIG1hc2tzCj4gPiA+ICsgICAgICAgICogZm9yIGVhY2ggZXZlbnQgdGhhdCBpcyBleHBlY3Rl
ZCB0byBiZSBnZW5lcmF0ZWQKPiA+ID4gKyAgICAgICAgKi8KPiA+ID4gKyAgICAgICBpZiAoc2V0
dXBfbWFya3MoZmFub3RpZnlfZmQsIHRjKSAhPSAwKQo+ID4gPiArICAgICAgICAgICAgICAgcmV0
dXJuOwo+ID4gPiArCj4gPgo+ID4gU29ycnksIGp1c3Qgbm90aWNlcyBhIHRlc3QgYnVnLgo+ID4g
ZmFub3RpZnlfZmQgbmVlZHMgdG8gYmUgY2xvc2VkIGJlZm9yZSByZXR1cm5pbmcgZnJvbSB0aGlz
IGZ1bmN0aW9uLAo+ID4gYmVjYXVzZSBuZXh0IHRlc3QgY2FzZSBpcyBnb2luZyB0byBvdmVyd3Jp
dGUgZmFub3RpZnlfZmQuCj4gPiBkb19jbGVhbnVwKCkgaXMgY2FsbGVkIG9ubHkgYXQgZW5kIG9m
IGVudGlyZSB0ZXN0IG9yIG9uIHRzdF9icmsoKS4KPiA+Cj4gPiBUaGlzIG5lZWRzIHRvIGJlIGZp
eGVkIGZvciBmYW5vdGlmeTE0IGFuZCBmYW5vdGlmeTE1IGFzIHdlbGwuCj4KPiBBaCwgeWVzLiBU
aGFuayB5b3UgQW1pciBhbmQgZ29vZCBzcG90dGluZy4gSSd2ZSBhbHNvIHVwZGF0ZWQKPiBUU1Rf
VEVTVF9DT05GKCkgdG8gVFNUX1RFU1RfVENPTkYoKS4gVGhlIGJyYW5jaCBjb250YWluaW5nIHRo
ZXNlIHVwZGF0ZXMKPiBjYW4gYmUgZm91bmQgaGVyZToKPiAgICAgICAgIC0gaHR0cHM6Ly9naXRo
dWIuY29tL21hdHRoZXdib2Jyb3dza2kvbHRwL2NvbW1pdHMvZmFub3RpZnlfZGlyZW50Cj4KPiBQ
bGVhc2UgY2hlY2suCgpUaGVyZSB3ZXJlIHN0aWxsIHByb2JsZW1zIHdpdGggdW5iYWxhbmNlZCBj
bG9zZS4KSSBmaXhlcyB0aGVtIHVwIGFuZCBwdXNoZWQgdG8gbXkgYnJhbmNoLgoKTW9zdCBsdHAg
dGVzdHMgYXJlIHdyaXR0ZW4gbGlrZSB0aGlzOgpkb190ZXN0KCkKLi4uCmRvX3NldHVwKCkKZG9f
Y2xlYW51cCgpCgphbmQgZm9yIGEgZ29vZCByZWFzb24gc28gaXQgaXMgZWFzeSB0byBwYWlyIHVw
IGZ1bGwgdGVzdCByZXNvdXJjZSBzZXR1cAp3aXRoIGZ1bGwgdGVzdCByZXNvdXJjZSBjbGVhbnVw
LgpUaGlzIGluY2x1ZGVzIHJlc291cmNlcyB0aGF0IGFyZSBhbGxvY2F0ZWQgbm90IHBlciB0ZXN0
IGNhc2UgYW5kIG5vdApwZXIgdGVzdCBsb29wCihlLmcuIC4vZmFub3RpZnkxMyAtaSAyKQoKSSBy
ZW9yZGVyZWQgdGhlIHRlc3RzIGNvZGUgdG8gbWF0Y2ggdGhpcyBwYXR0ZXJuLgpQbGVhc2UgaG9s
ZCBvZmYgd2l0aCBwb3N0aW5nIHY1LCBiZWNhdXNlIEkgd2FudCB0byBzZWUgdGhhdCBhZnRlciB3
ZSBmaXgKdGhlIGZzaWQgY2FjaGUgYnVnLCB0aGUgbmV3IHRlc3Qgd2lsbCBwYXNzLgoKVGhhbmtz
LApBbWlyLgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
