Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6F71C3E80
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 17:31:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 138A13C5866
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 17:31:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B42FF3C0431
 for <ltp@lists.linux.it>; Mon,  4 May 2020 17:31:29 +0200 (CEST)
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CB9A51400B6F
 for <ltp@lists.linux.it>; Mon,  4 May 2020 17:31:28 +0200 (CEST)
Received: by mail-il1-x141.google.com with SMTP id b18so108412ilf.2
 for <ltp@lists.linux.it>; Mon, 04 May 2020 08:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0jpg68GIo8Z6yvrqhXbifBMC3eJtBUdtCD1llvjzBQQ=;
 b=FPMuVmKaSRc3cix06FfP8SUf9S5+mAzMJsBg90zfRLeUa9MXOu7Up3jljOGOGiqM6N
 /B3t4T9SS4hbEKagelV5WXpEC7pAyFuSJjrDoVLTy5HqzUy9d7/yVVwjbXqpytfPCMjb
 gv8HAXWX1XoFOCBFHwQQgzbD1+/LC5nVm4LIw+x5ykWSCnBUPdkl8nMJdTL67M4wjEA3
 KZ4uwDte7C4mUuZKcW8Z/bdQaiB7rZ31TUaFr3QXIj9vDHJw3cZ0eS2i+rBu5ra8feiH
 H6a+JOL0Gr4mU07j4gkXQUxshbmbTYn0UireYIjANx7CwUpH5yiJVQx06x+z5QZkJzfT
 mi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0jpg68GIo8Z6yvrqhXbifBMC3eJtBUdtCD1llvjzBQQ=;
 b=ifT0dN0wy1fTu0egS5X8XgP+3L0rbs0m6fiWl8O8zkir96a9Jrr32BV1lRDpjiBWzN
 lx2FF2lv27gZmTJmWv4GP3uYjMqelaSjImDrQxjWu1PyXNFeg1IeQi54/grxd3HM8+k5
 KVBmGoY3Ate+4CIluyl4DUfanvBrtzrjx9/m7phtl1SipByNfhs81JYv1ZjsoWMgcq2G
 He+JOyI4RHC+GlsfCFIIMH//tRaK+qFo9n+XCXNqW4AkbJmyx1TJTRNo4v22VkQAa9Be
 AMKasoeg3ZPl8d7Br0Qv6dYYUfAsxxrCrjbNBu7h+1zgv0kfmopbqLCL8YkIl4chqw5e
 jerQ==
X-Gm-Message-State: AGi0PuZq1Hquj/c/yESvsOV37DWQ569yZCEXmDRiANeT8tJHGnRZQCUa
 XPcoHz1vDCsRKZ3cPtMqb6uPo1vr+4wpAQW36Ug=
X-Google-Smtp-Source: APiQypJgM88HfSCOnu1rkrbidfqYvrFgP7pd5+V3pNwX8hoe0Yqhqqme7kkd5CDsdp9TPVgDjhK7+kpFux3jVVm1Swo=
X-Received: by 2002:a92:7303:: with SMTP id o3mr16594637ilc.275.1588606287431; 
 Mon, 04 May 2020 08:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200502162744.9589-1-amir73il@gmail.com>
 <20200502162744.9589-4-amir73il@gmail.com>
 <20200504120740.GA6452@dell5510>
In-Reply-To: <20200504120740.GA6452@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 4 May 2020 18:31:16 +0300
Message-ID: <CAOQ4uxgMrdMNVEm09Udude2eC4bxQC6bWQfzhB2z5FSBDh03xw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/4] syscalls/fanotify: New test for
 FAN_MODIFY_DIR
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gTW9uLCBNYXkgNCwgMjAyMCBhdCAzOjA3IFBNIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6
PiB3cm90ZToKPgo+IEhpIEFtaXIsCj4KPiB3aGlsZSB3YWl0aW5nIGZvciB5b3UgYW5kIEphbiB0
byBhZ3JlZSB3aGV0aGVyIHdob2xlIHBhdGNoc2V0IHNob3VsZCBiZSBtZXJnZWQKPiBJIGhhdmUg
MiBmaXhlcyBmb3IgdjIuCj4KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgZmFub3RpZnlfc2F2ZV9m
aWQoY29uc3QgY2hhciAqcGF0aCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGZhbm90aWZ5X2ZpZF90ICpmaWQpCj4gPiArewo+ID4gKyAgICAgaW50ICpmaCA9
IChpbnQgKikoZmlkLT5oYW5kbGUuZl9oYW5kbGUpOwo+ID4gKwo+ID4gKyAgICAgZmhbMF0gPSBm
aFsxXSA9IGZoWzJdID0gMDsKPiA+ICsgICAgIGZpZC0+aGFuZGxlLmhhbmRsZV9ieXRlcyA9IE1B
WF9IQU5ETEVfU1o7Cj4gPiArICAgICBmYW5vdGlmeV9nZXRfZmlkKHBhdGgsICZmaWQtPmZzaWQs
ICZmaWQtPmhhbmRsZSk7Cj4gPiArCj4gPiArICAgICB0c3RfcmVzKFRJTkZPLAo+ID4gKyAgICAg
ICAgICAgICAiZmlkKCVzKSA9ICV4LiV4LiV4LiV4LiV4Li4uIiwgcGF0aCwKPiA+ICsgICAgICAg
ICAgICAgRlNJRF9WQUxfTUVNQkVSKGZpZC0+ZnNpZCwgMCksIEZTSURfVkFMX01FTUJFUihmaWQt
PmZzaWQsIDEpLAo+ID4gKyAgICAgICAgICAgICBmaFswXSwgZmhbMV0sIGZoWzJdKTsKPgo+IFdl
J3JlIHVzaW5nIF9fa2VybmVsX2ZzaWRfdCwgd2hpY2ggaGFzIHZhbCBtZW1iZXIgb24gYm90aCBs
aWJjIGFuZCBtdXNsLAo+IHRodXMgaXQgbXVzdCBiZToKPiAtICAgICAgICAgICAgICAgImZpZCgl
cykgPSAleC4leC4leC4leC4leC4uLiIsIHBhdGgsCj4gLSAgICAgICAgICAgICAgIEZTSURfVkFM
X01FTUJFUihmaWQtPmZzaWQsIDApLCBGU0lEX1ZBTF9NRU1CRVIoZmlkLT5mc2lkLCAxKSwKPiAt
ICAgICAgICAgICAgICAgZmhbMF0sIGZoWzFdLCBmaFsyXSk7Cj4gKyAgICAgICAgICAgICAgICJm
aWQoJXMpID0gJXguJXguJXguJXguJXguLi4iLCBwYXRoLCBmaWQtPmZzaWQudmFsWzBdLAo+ICsg
ICAgICAgICAgICAgICBmaWQtPmZzaWQudmFsWzFdLCBmaFswXSwgZmhbMV0sIGZoWzJdKTsKPgoK
U3VyZS4gSSBkaWRuJ3QgZ2V0IHRoZSB3aG9sZSBGU0lEX1ZBTF9NRU1CRVIgdGhpbmcgY29ycmVj
dGx5LgpXaGF0ZXZlciB3b3JrcyBvbiBhbGwgcGxhdGZvcm1zLgpJdHMganVzdCBhbiBpbmZvIG1l
c3NhZ2UgYW55d2F5LgoKPiAuLi4KPiA+ICsgICAgICAgICAgICAgfSBlbHNlIGlmIChtZW1jbXAo
JmV2ZW50X2ZpZC0+ZnNpZCwgJmV4cGVjdGVkLT5maWQtPmZzaWQsCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNpemVvZihldmVudF9maWQtPmZzaWQpKSAhPSAwKSB7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgdHN0X3JlcyhURkFJTCwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJnb3QgZXZlbnQ6IG1hc2s9JWxseCBwaWQ9JXUgZmQ9JWQgbmFtZT0nJXMn
ICIKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJsZW49JWQgaW5mb190eXBlPSVk
IGluZm9fbGVuPSVkIGZoX2xlbj0lZCAiCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAiZnNpZD0leC4leCAoZXhwZWN0ZWQgJXguJXgpIiwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpZXZlbnQtPm1hc2ssCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAodW5zaWduZWQpZXZlbnQtPnBpZCwgZXZlbnQtPmZkLCBmaWxl
bmFtZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV2ZW50LT5ldmVudF9sZW4s
IGluZm9fdHlwZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV2ZW50X2ZpZC0+
aGRyLmxlbiwgZmhsZW4sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGU0lEX1ZB
TF9NRU1CRVIoZXZlbnRfZmlkLT5mc2lkLCAwKSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEZTSURfVkFMX01FTUJFUihldmVudF9maWQtPmZzaWQsIDEpLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgRlNJRF9WQUxfTUVNQkVSKGV4cGVjdGVkLT5maWQtPmZzaWQs
IDApLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRlNJRF9WQUxfTUVNQkVSKGV4
cGVjdGVkLT5maWQtPmZzaWQsIDEpKTsKPgo+IEFsc28gaGVyZSAzcmQgYW5kIDR0aCBhY2Nlc3Mg
bXVzdCBiZSBkaXJlY3QgYXMgaXQgaXMgZXZlbnRfdDoKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEZTSURfVkFMX01FTUJFUihleHBlY3RlZC0+ZmlkLT5mc2lkLCAwKSwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZTSURfVkFMX01FTUJFUihleHBlY3RlZC0+Zmlk
LT5mc2lkLCAxKSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBleHBlY3RlZC0+
ZmlkLT5mc2lkLnZhbFswXSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4cGVj
dGVkLT5maWQtPmZzaWQudmFsWzFdKTsKPgo+IEZZSSBGU0lEX1ZBTF9NRU1CRVIgaXMgb25seSBm
b3IgZXZlbnRfZmlkLiBJJ20gc29ycnksIGFsdGhvdWdoIHRoZXJlIGlzIGEgbm90ZQo+IGluIGZh
bm90aWZ5LmgsIGl0J3MgYSBiaXQgY29uZnVzaW5nIChzZWUgZjM3NzA0ZDZjIGZhbm90aWZ5OiBG
aXgKPiBGU0lEX1ZBTF9NRU1CRVIoKSB1c2FnZSkuCj4KPiBUaGVyZSBpcyBhbHNvIHdhcm5pbmcg
b24gYXJyYXkgc2l6ZSBvbiBuZXdlciBjb21waWxlcnM6Cj4KPiAgIDM3OCB8ICBzcHJpbnRmKGZu
YW1lMSwgIiVzLyVzIiwgZG5hbWUxLCBGSUxFX05BTUUxKTsKPiAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgIF5+Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC91c3IvaW5jbHVkZS9zdGRpby5o
Ojg2NywKPiAgICAgICAgICAgICAgICAgIGZyb20gZmFub3RpZnkxNi5jOjEzOgo+IC91c3IvaW5j
bHVkZS9iaXRzL3N0ZGlvMi5oOjM2OjEwOiBub3RlOiDigJhfX2J1aWx0aW5fX19zcHJpbnRmX2No
a+KAmSBvdXRwdXQgYmV0d2VlbiAxMiBhbmQgMjY3IGJ5dGVzIGludG8gYSBkZXN0aW5hdGlvbiBv
ZiBzaXplIDI1Ngo+ICAgIDM2IHwgICByZXR1cm4gX19idWlsdGluX19fc3ByaW50Zl9jaGsgKF9f
cywgX19VU0VfRk9SVElGWV9MRVZFTCAtIDEsCj4gICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAzNyB8ICAg
ICAgIF9fYm9zIChfX3MpLCBfX2ZtdCwgX192YV9hcmdfcGFjayAoKSk7Cj4gICAgICAgfCAgICAg
ICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gZmFub3RpZnkxNi5jOjM3
OToyMjogd2FybmluZzog4oCYJXPigJkgZGlyZWN0aXZlIHdyaXRpbmcgMTAgYnl0ZXMgaW50byBh
IHJlZ2lvbiBvZiBzaXplIGJldHdlZW4gMCBhbmQgMjU1IFstV2Zvcm1hdC1vdmVyZmxvdz1dCj4g
ICAzNzkgfCAgc3ByaW50ZihmbmFtZTIsICIlcy8lcyIsIGRuYW1lMSwgRklMRV9OQU1FMik7Cj4g
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICBefgo+Cj4gSXQgY2FuIGJlIGZpeGVkIGJ5IGlu
Y3JlYXNpbmcgdGhlIHNpemUgb2YgZm5hbWUxIGFuZCBmbmFtZTI6Cj4gLXN0YXRpYyBjaGFyIGZu
YW1lMVtCVUZfU0laRV0sIGZuYW1lMltCVUZfU0laRV07Cj4gK3N0YXRpYyBjaGFyIGZuYW1lMVtC
VUZfU0laRSArIDExXSwgZm5hbWUyW0JVRl9TSVpFICsgMTFdOwo+Cj4gSSBkb24ndCBsaWtlIHRo
YXQgY29kZSBidXQgb24gdGhlIG90aGVyIGhhbmQgZG9uJ3QgbGlrZSBpbnRyb2R1Y2luZyB3YXJu
aW5ncwo+IGVpdGhlci4KCldoYXRldmVyIHdvcmtzIGZvciB5b3UgaXMgZmluZSBieSBtZS4KClRo
YW5rcywKQW1pci4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
