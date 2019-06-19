Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2414B630
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 12:28:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0D043EA8E8
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 12:28:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A129F3EA2E7
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 12:28:40 +0200 (CEST)
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9722B1401124
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 12:28:38 +0200 (CEST)
Received: by mail-yw1-xc41.google.com with SMTP id l79so8056652ywe.11
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 03:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wTmawIZnWFcKIvRc3hH4MKD1jIikQX4tZgkUKJSUzaY=;
 b=T5bJ5UiwifhxqvB+vYOJhIwRv+rv+tGAZ+LH3B4AiZXvCG8Xf7nglPFfx2Q0VgpbIX
 OhZDoLLU0Wlo+TO6DvbjWoJOypz+wFUvsSdU5WmknT8UHIQim4peJ1HcCx+K9/SjazAA
 tB5vYjbCHk5dE0yMKx3zipB/KjXvmwxJ08IMymwlnE9miJ1B2DeFHUXoy/hGZm61zmlO
 lL17NQu9Iop97OI0OhoqqXg65naph9OvToHAoP3uQG8VoFzjduX8t+VeYKvlksBGm74E
 gry+2ArDIwV9YIYryC/1DWIDZoKbAp577GBFuCMl3GNCPrE5QZdW8COWCjRyqq0yGaTK
 1zHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wTmawIZnWFcKIvRc3hH4MKD1jIikQX4tZgkUKJSUzaY=;
 b=jufTjxyzx5L/pCbLCtjS1dp4l1NhV+C4Wfs84Py6+bfXSc1Rt14Dxc6azDXhu8IMZO
 uSZoQ3XV7TuyQ51mkL7JYhMiPIFaTCL3+dcg8o/6XLS2tn64kl+VA2bOviPDh5Yw2x0N
 vEZMnthKaKPhb3DMNAb5mE0NouBONWvgM0EQ0YpZuVCbuEJpqEQn1DtwiHvTKH6xL9TP
 zQa6HeyH7JTUeyaQMUaZ4b74ACT/pndZckKBabXvDxHK+A+B8PfNCO8rkeJ0ymjFiWzw
 Ev3l7hR+uxiDptEw6OS+IJDYjKoP3GxnJXNcQnxnEs3qRBC4mjh3ALKqk2v5qmDq5K5N
 fj0Q==
X-Gm-Message-State: APjAAAXLFomuAp2NXQCYC78S+6yTTAWy+MhmMkGXtKaNZNaG9r1ZSgO6
 NlchSNxwFRucEiWz/bEAQnR+vJII3wzV24NX+RU=
X-Google-Smtp-Source: APXvYqxMS74EKD1vthNBmw/vrmdJjYopVycQp62jOtHBz8woSfjz/ljPIydBVS3e/q253HkSqOMSdUd5Z22Q/5BToVs=
X-Received: by 2002:a0d:f5c4:: with SMTP id e187mr54045088ywf.88.1560940117428; 
 Wed, 19 Jun 2019 03:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
 <20190617150640.GD16831@rei>
 <CAOQ4uxithmPn6J=B2kaGKT0JOpqzyVEkHU+zMqhXCYnnH+ZHVQ@mail.gmail.com>
 <20190619095805.GC16577@rei.lan>
In-Reply-To: <20190619095805.GC16577@rei.lan>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 19 Jun 2019 13:28:26 +0300
Message-ID: <CAOQ4uxiahDrw157AmkKch+S29zxHU6neVOU9EmYaAcYtDzfVdg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v4] syscalls/sync_file_range: add partial file
	sync test-cases
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

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6NTggUE0gQ3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1
c2UuY3o+IHdyb3RlOgo+Cj4gSGkhCj4gPiA+IFdpdGggdGhlc2UgbW9kaWZpY2F0aW9uIHRoZSB0
ZXN0IHdhcyBzdGFibGUgYW5kIHdvcmtlZCBmaW5lIGZvciBtb3JlCj4gPiA+IHRoYW4gMTAwIGl0
ZXJhdGlvbnMgZm9yIG1lLiBJdCBzdGlsbCBmYWlscyBmb3IgRlVTRSBiYXNlZCBmaWxlc3lzdGVt
cwo+ID4gPiBidXQgdGhhdCBpcyB0byBiZSBleHBlY3RlZCBzaW5jZSBGVVNFIGRvZXMgbm90IGlt
cGxlbWVudCBzeW5jX2ZpbGVfcmFuZ2UKPiA+ID4geWV0Lgo+ID4gPgo+ID4KPiA+IFdoYXQgaXMg
dGhlIHByb3Bvc2VkIHdheSB0byByZXNvbHZlIHRoaXMgZmFpbHVyZT8KPiA+IElmIEZVU0UgZG9l
cyBub3QgaW1wbGVtZW50IHN5bmNfZmlsZV9yYW5nZSwgc2hvdWxkbid0IHRlc3QgZGV0ZWN0Cj4g
PiBpdCBhbmQgcmV0dXJuIFRDT05GPwo+Cj4gV2VsbCB0aGUgY2FsbCByZXR1cm5zIHN1Y2Nlc3Mg
YnV0IGRvZXMgbm90IHN5bmMgYW55dGhpbmcgb24gRlVTRSBiYXNlZAo+IGZpbGVzeXN0ZW1zIHNv
IHRoZSBjaG9pY2VzIGhlcmUgYXJlOgo+Cj4gMSkgRGlzYWJsZSB0aGUgdGVzdCBvZiBGVVNFCj4g
MikgS2VlcCB0aGUgdGVzdCBmYWlsaW5nIGFuZCBpZ25vcmUgdGhlIGZhaWx1cmVzCj4KPiBXaGlj
aCBvbmUgZG8geW91IHByZWZlcj8KPgoKSSBwcmVmZXIgdGhlIGZpcnN0IG9wdGlvbi4KCk15IHBy
ZWZlcmVuY2UgbWF5IHNlZW0gaW5jb25zaXN0ZW50IHdpdGggbXkgb3BpbmlvbiB0aGF0CkZfU0VU
TEVBU0UgdGVzdHMgc2hvdWxkIE5PVCBiZSBkaXNhYmxlZCBmb3Igb3ZlcmxheWZzLgoKVGhlIGRp
ZmZlcmVuY2UgaXMgdGhhdCBzeW5jX2ZpbGVfcmFuZ2UoKSBBUEkgZG9lcyBub3QgcHJvbWlzZQph
bnkgcmVhbCBndWFyYW50aWVzIHZzLiBGX1NFVExFQVNFIHRoYXQgaGFzIGEgdmVyeSBjbGVhcgpk
ZWZpbml0aW9uIG9mIGhvdyBpdCBzaG91bGQgYmVoYXZlLgpBIHN1YnRsZSBkaWZmZXJlbmNlLCBi
dXQgSSB0aGluayBpdCBtYXR0ZXJzLgoKQlRXLCBJIGRpZCBhbHJlYWR5IGZpeCB0aGUgb3Zlcmxh
eWZzIEZfU0VUTEVBU0UgYnVnLgpJdCBpcyBxdWV1ZWQgZm9yIDUuMyAoYnkgZmlsZSBsb2NrcyBt
YWludGFpbmVyKS4KSSB3aWxsIHBvc3QgZml4ZXMgdG8gTFRQIEZfU0VUTEVBU0UgdGVzdHMgb25j
ZSB0aGUga2VybmVsCmZpeCBpcyBtZXJnZWQuCgpUaGFua3MsCkFtaXIuCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
