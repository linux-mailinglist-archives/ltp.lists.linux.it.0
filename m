Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 129F64AD46
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 23:23:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D70043EA3E8
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 23:23:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 38DF43EA2FD
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 23:23:47 +0200 (CEST)
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 59A9720039B
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 23:23:47 +0200 (CEST)
Received: by mail-yb1-xb44.google.com with SMTP id x187so6657048ybc.11
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 14:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/GAyYMnvTk4UUBc1vRspSg6YPmCIcw+Ra/kxCguSvsU=;
 b=sNYi1YzCmnY08ToD8N6aixgU0orHMEhTdKEDITaJZvB3Uqxr/TQxo6NcLeYKEhDxd6
 w32Aro+WFWhDvkuBN/i0fd1b9nD0FN/c8e+WHrDrImAQQHbpURg7Z9pVY3no/pSQ3S6w
 GY5aDJ8+EFFNKAujQr9A7tcrv2q/YIzaDnykOb4f+LWmt8txCVhxxiAz5OYIBLBW7HqN
 ngCruJYC39Q9vqhe1wy+WjL38jHQY/0mpdqtDAd8F63+V+s/chJZkRF/ypxoM2/S74Ny
 cH90refK8W9qLy1DDZzlaU1IKZING9G8RviYzNohTTmoKxxjU43x2rrNBoMq67A8qcLu
 Jcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/GAyYMnvTk4UUBc1vRspSg6YPmCIcw+Ra/kxCguSvsU=;
 b=b2SrwI1AC22rZ4Dc/OUsMBhZuuE1R+SMti9q626+Xuq6bo1B++tWhM2Ca72/SSJ5dK
 McM6kYOKWbsFVQM8G9d0kDhIWPNNgtAFH4p5NvtviZR4XNBr84h8zpCFZ5viN5Nxk9yy
 y7ZYmmg36DOe+iCFfaktZpGzOYb99ZDPWmES078PySH2hmWhVQd6zH1izVWWMq2unCwz
 MOl6PAksUojMXtK/6aUmOOcMSSEbBTirGPq/LKcl9kt6W8nKdFbIoMN/ObOlcT1x6nhJ
 tcOeQpnqgg6+FZkRB/SMB26UhnHDUT0Y7tYf5z/xFBgJhe5yqqf63MD2zofxYm6y0TsM
 pIfA==
X-Gm-Message-State: APjAAAW6oLe2LLjgbk9z9RwSe4XADVHx3SR23VjIADm+bN8Mf/Yu9XW5
 CdL70YBYUrcGA8KAaukxIDZbeJJclavTNUUYJOQ=
X-Google-Smtp-Source: APXvYqxFNrz1xKVy8ho9Ejo3gu6S2mXSSkFjlEoWQLNRXnmmPz4MgxVhxSy9EoL07UjcreK/Z7F/cmU+6WwgYJbzCmE=
X-Received: by 2002:a25:dc88:: with SMTP id y130mr10372525ybe.14.1560893026181; 
 Tue, 18 Jun 2019 14:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560766652.git.mbobrowski@mbobrowski.org>
 <6c25395422b19d2a4e2c66937afcaa767b83e776.1560766652.git.mbobrowski@mbobrowski.org>
In-Reply-To: <6c25395422b19d2a4e2c66937afcaa767b83e776.1560766652.git.mbobrowski@mbobrowski.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 19 Jun 2019 00:23:34 +0300
Message-ID: <CAOQ4uxgzA83i=rdQX+076_vZ2LE0Vihv1Fc0MXyXS4r-U4a93Q@mail.gmail.com>
To: Matthew Bobrowski <mbobrowski@mbobrowski.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

PiArc3RhdGljIHZvaWQgZG9fdGVzdCh1bnNpZ25lZCBpbnQgbnVtYmVyKQo+ICt7Cj4gKyAgICAg
ICB1bnNpZ25lZCBpbnQgaTsKPiArICAgICAgIGludCBsZW4sIGZkc1tBUlJBWV9TSVpFKG9iamVj
dHMpXTsKPiArCj4gKyAgICAgICBzdHJ1Y3QgZmlsZV9oYW5kbGUgKmV2ZW50X2ZpbGVfaGFuZGxl
Owo+ICsgICAgICAgc3RydWN0IGZhbm90aWZ5X2V2ZW50X21ldGFkYXRhICptZXRhZGF0YTsKPiAr
ICAgICAgIHN0cnVjdCBmYW5vdGlmeV9ldmVudF9pbmZvX2ZpZCAqZXZlbnRfZmlkOwo+ICsgICAg
ICAgc3RydWN0IHRlc3RfY2FzZV90ICp0YyA9ICZ0ZXN0X2Nhc2VzW251bWJlcl07Cj4gKyAgICAg
ICBzdHJ1Y3QgZmFub3RpZnlfbWFya190eXBlICptYXJrID0gJnRjLT5tYXJrOwo+ICsKPiArICAg
ICAgIHRzdF9yZXMoVElORk8sCj4gKyAgICAgICAgICAgICAgICJUZXN0ICMlZDogRkFOX1JFUE9S
VF9GSUQgd2l0aCBtYXJrIGZsYWc6ICVzIiwKPiArICAgICAgICAgICAgICAgbnVtYmVyLCBtYXJr
LT5uYW1lKTsKPiArCj4gKyAgICAgICBmYW5vdGlmeV9mZCA9IGZhbm90aWZ5X2luaXQoRkFOX0NM
QVNTX05PVElGIHwgRkFOX1JFUE9SVF9GSUQsIE9fUkRPTkxZKTsKPiArICAgICAgIGlmIChmYW5v
dGlmeV9mZCA9PSAtMSkgewo+ICsgICAgICAgICAgICAgICBpZiAoZXJybm8gPT0gRUlOVkFMKSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdHN0X3JlcyhUQ09ORiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJGQU5fUkVQT1JUX0ZJRCBub3Qgc3VwcG9ydGVkIGJ5IGtlcm5l
bCIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiArICAgICAgICAgICAgICAg
fQo+ICsgICAgICAgICAgICAgICB0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICJmYW5vdGlmeV9pbml0KEZBTl9DTEFTU19OT1RJRiB8IEZBTl9SRVBPUlRf
RklELCAiCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIk9fUkRPTkxZKSBmYWlsZWQiKTsKPiAr
ICAgICAgIH0KPiArCj4gKyAgICAgICAvKiBQbGFjZSBtYXJrcyBvbiBhIHNldCBvZiBvYmplY3Rz
IGFuZCBzZXR1cCB0aGUgZXhwZWN0ZWQgbWFza3MKPiArICAgICAgICAqIGZvciBlYWNoIGV2ZW50
IHRoYXQgaXMgZXhwZWN0ZWQgdG8gYmUgZ2VuZXJhdGVkCj4gKyAgICAgICAgKi8KPiArICAgICAg
IGlmIChzZXR1cF9tYXJrcyhmYW5vdGlmeV9mZCwgdGMpICE9IDApCj4gKyAgICAgICAgICAgICAg
IHJldHVybjsKPiArCgpTb3JyeSwganVzdCBub3RpY2VzIGEgdGVzdCBidWcuCmZhbm90aWZ5X2Zk
IG5lZWRzIHRvIGJlIGNsb3NlZCBiZWZvcmUgcmV0dXJuaW5nIGZyb20gdGhpcyBmdW5jdGlvbiwK
YmVjYXVzZSBuZXh0IHRlc3QgY2FzZSBpcyBnb2luZyB0byBvdmVyd3JpdGUgZmFub3RpZnlfZmQu
CmRvX2NsZWFudXAoKSBpcyBjYWxsZWQgb25seSBhdCBlbmQgb2YgZW50aXJlIHRlc3Qgb3Igb24g
dHN0X2JyaygpLgoKVGhpcyBuZWVkcyB0byBiZSBmaXhlZCBmb3IgZmFub3RpZnkxNCBhbmQgZmFu
b3RpZnkxNSBhcyB3ZWxsLgoKQWxzbywgcGxlYXNlIHNlZSBteSBmYW5vdGlmeV9kZW50cnkgYnJh
bmNoIG9uIGdpdGh1YiBmb3IgYW4gZXh0cmEKcGF0Y2ggdG8gZmFub3RpZnkxMyB0byBjb3ZlciBh
IGJ1ZyByZXBvcnRlZCBieSBzeXpib3Q6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1m
c2RldmVsL0NBT1E0dXhoc25PWFhWQ3VPVDRwNGNfa29CTUZmcHJXd2R0Q1BHTkdoenByRmFKWndS
QUBtYWlsLmdtYWlsLmNvbS9ULyN0CgpQbGVhc2UgaW5jbHVkZSB0aGlzIGV4dHJhIHBhdGNoIGlu
IHlvdXIgbmV4dCBzZXJpZXMgcG9zdGluZy4KClRoYW5rcywKQW1pci4KCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
