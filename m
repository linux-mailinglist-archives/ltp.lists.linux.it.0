Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B61AA4B02E
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 04:35:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89604294AE7
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 04:35:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D0C6B3EA379
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 04:35:28 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B58301400764
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 04:35:27 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id w10so4094090pgj.7
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 19:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4r4y+v14OdyWwgImBGsKBO/sbclrb6HsQudMt8yeKjY=;
 b=GDK6vYbk8NX75mIX6lPOprAW6DVyVAe7qtIsjzHxQVHnTAQrl9ujQUGFYPlCGEhwYo
 DXuJyKvHKhjZHMwi6/LSlpk9/dwFL2a4kss3XZzfV2Lx+ZdNSZVrvMy4hYLbvclIxUEF
 K1MM2luGy92VW9Suj/esGb18T5//g+jeuTWtN0RUqDTuqK4S4D6FX0uoBFhtLktz8BCv
 od1He/5RuDzDdF6FVIxP7Ob2xqVLorqspxdqWNu8xBhsX1q19LIPKxFHInHBIz3/0GzZ
 G4EupkY1T30Dvd/ziRvRdNauYRoOUqVKEFubw7Ak8VmSEc11+NOEsWbBPkxLxQ453NuA
 qXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4r4y+v14OdyWwgImBGsKBO/sbclrb6HsQudMt8yeKjY=;
 b=pa+Kv6Ib3g3Xckphgy61YYEnhP6kcccf0uBBom82UpZEwGIV8LlGD+yWbnWgYtOUBl
 EWExRIfldbzc3MuyQ1Cu9FukKfoVLIpXCsrjOoRZtr0M14Z8cjDCx7rm3KD34CO/F6U+
 EYA9F1shqH6qH5T7qhdL4DD2MmAbKuZxhx73uqhe9eIYQ+eTsGc88uELQypDfK1fxb6c
 ze5nPYBZHgytrcEKwIybs6ZGw01qhBa5G/+VZV+JVmcW5AZYQ9Z8Poguhxg2MoLYg314
 hRycsO9tiD2xvX5rIXfVNtt5twghbm7Wa4lBR7R8YUEjrdshirnsyNkeKLZS8/fHr9Ah
 Rzaw==
X-Gm-Message-State: APjAAAW+aPqtm4wuKNqOjefnoNQqml5o8ZeNvBiMeNRZP6OxBfCUZzpK
 Yr4ZvsFuSolgh1IDKWI+6Jiy
X-Google-Smtp-Source: APXvYqyRglz/MAlRVLdrVyU4gxE4l5lVCKjYg4KpZk35l/uJXhe9AqPGSm8N8KVvOF4lQpm8vB0FZQ==
X-Received: by 2002:a63:2cc4:: with SMTP id s187mr199602pgs.36.1560911725952; 
 Tue, 18 Jun 2019 19:35:25 -0700 (PDT)
Received: from neo (122.22.96.58.static.exetel.com.au. [58.96.22.122])
 by smtp.gmail.com with ESMTPSA id c124sm16495151pfa.115.2019.06.18.19.35.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 19:35:25 -0700 (PDT)
Date: Wed, 19 Jun 2019 12:35:14 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190619023512.GA25967@neo>
References: <cover.1560766652.git.mbobrowski@mbobrowski.org>
 <6c25395422b19d2a4e2c66937afcaa767b83e776.1560766652.git.mbobrowski@mbobrowski.org>
 <CAOQ4uxgzA83i=rdQX+076_vZ2LE0Vihv1Fc0MXyXS4r-U4a93Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxgzA83i=rdQX+076_vZ2LE0Vihv1Fc0MXyXS4r-U4a93Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6MjM6MzRBTSArMDMwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gPiArc3RhdGljIHZvaWQgZG9fdGVzdCh1bnNpZ25lZCBpbnQgbnVtYmVyKQo+ID4g
K3sKPiA+ICsgICAgICAgdW5zaWduZWQgaW50IGk7Cj4gPiArICAgICAgIGludCBsZW4sIGZkc1tB
UlJBWV9TSVpFKG9iamVjdHMpXTsKPiA+ICsKPiA+ICsgICAgICAgc3RydWN0IGZpbGVfaGFuZGxl
ICpldmVudF9maWxlX2hhbmRsZTsKPiA+ICsgICAgICAgc3RydWN0IGZhbm90aWZ5X2V2ZW50X21l
dGFkYXRhICptZXRhZGF0YTsKPiA+ICsgICAgICAgc3RydWN0IGZhbm90aWZ5X2V2ZW50X2luZm9f
ZmlkICpldmVudF9maWQ7Cj4gPiArICAgICAgIHN0cnVjdCB0ZXN0X2Nhc2VfdCAqdGMgPSAmdGVz
dF9jYXNlc1tudW1iZXJdOwo+ID4gKyAgICAgICBzdHJ1Y3QgZmFub3RpZnlfbWFya190eXBlICpt
YXJrID0gJnRjLT5tYXJrOwo+ID4gKwo+ID4gKyAgICAgICB0c3RfcmVzKFRJTkZPLAo+ID4gKyAg
ICAgICAgICAgICAgICJUZXN0ICMlZDogRkFOX1JFUE9SVF9GSUQgd2l0aCBtYXJrIGZsYWc6ICVz
IiwKPiA+ICsgICAgICAgICAgICAgICBudW1iZXIsIG1hcmstPm5hbWUpOwo+ID4gKwo+ID4gKyAg
ICAgICBmYW5vdGlmeV9mZCA9IGZhbm90aWZ5X2luaXQoRkFOX0NMQVNTX05PVElGIHwgRkFOX1JF
UE9SVF9GSUQsIE9fUkRPTkxZKTsKPiA+ICsgICAgICAgaWYgKGZhbm90aWZ5X2ZkID09IC0xKSB7
Cj4gPiArICAgICAgICAgICAgICAgaWYgKGVycm5vID09IEVJTlZBTCkgewo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgdHN0X3JlcyhUQ09ORiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIkZBTl9SRVBPUlRfRklEIG5vdCBzdXBwb3J0ZWQgYnkga2VybmVsIik7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gPiArICAgICAgICAgICAgICAgfQo+ID4g
KyAgICAgICAgICAgICAgIHRzdF9icmsoVEJST0sgfCBURVJSTk8sCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAiZmFub3RpZnlfaW5pdChGQU5fQ0xBU1NfTk9USUYgfCBGQU5fUkVQT1JUX0ZJ
RCwgIgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIk9fUkRPTkxZKSBmYWlsZWQiKTsKPiA+
ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAvKiBQbGFjZSBtYXJrcyBvbiBhIHNldCBvZiBv
YmplY3RzIGFuZCBzZXR1cCB0aGUgZXhwZWN0ZWQgbWFza3MKPiA+ICsgICAgICAgICogZm9yIGVh
Y2ggZXZlbnQgdGhhdCBpcyBleHBlY3RlZCB0byBiZSBnZW5lcmF0ZWQKPiA+ICsgICAgICAgICov
Cj4gPiArICAgICAgIGlmIChzZXR1cF9tYXJrcyhmYW5vdGlmeV9mZCwgdGMpICE9IDApCj4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+IAo+IFNvcnJ5LCBqdXN0IG5vdGljZXMgYSB0
ZXN0IGJ1Zy4KPiBmYW5vdGlmeV9mZCBuZWVkcyB0byBiZSBjbG9zZWQgYmVmb3JlIHJldHVybmlu
ZyBmcm9tIHRoaXMgZnVuY3Rpb24sCj4gYmVjYXVzZSBuZXh0IHRlc3QgY2FzZSBpcyBnb2luZyB0
byBvdmVyd3JpdGUgZmFub3RpZnlfZmQuCj4gZG9fY2xlYW51cCgpIGlzIGNhbGxlZCBvbmx5IGF0
IGVuZCBvZiBlbnRpcmUgdGVzdCBvciBvbiB0c3RfYnJrKCkuCj4gCj4gVGhpcyBuZWVkcyB0byBi
ZSBmaXhlZCBmb3IgZmFub3RpZnkxNCBhbmQgZmFub3RpZnkxNSBhcyB3ZWxsLgoKQWgsIHllcy4g
VGhhbmsgeW91IEFtaXIgYW5kIGdvb2Qgc3BvdHRpbmcuIEkndmUgYWxzbyB1cGRhdGVkClRTVF9U
RVNUX0NPTkYoKSB0byBUU1RfVEVTVF9UQ09ORigpLiBUaGUgYnJhbmNoIGNvbnRhaW5pbmcgdGhl
c2UgdXBkYXRlcwpjYW4gYmUgZm91bmQgaGVyZToKCS0gaHR0cHM6Ly9naXRodWIuY29tL21hdHRo
ZXdib2Jyb3dza2kvbHRwL2NvbW1pdHMvZmFub3RpZnlfZGlyZW50CQoKUGxlYXNlIGNoZWNrLgog
Cj4gQWxzbywgcGxlYXNlIHNlZSBteSBmYW5vdGlmeV9kZW50cnkgYnJhbmNoIG9uIGdpdGh1YiBm
b3IgYW4gZXh0cmEKPiBwYXRjaCB0byBmYW5vdGlmeTEzIHRvIGNvdmVyIGEgYnVnIHJlcG9ydGVk
IGJ5IHN5emJvdDoKPiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mc2RldmVsL0NB
T1E0dXhoc25PWFhWQ3VPVDRwNGNfa29CTUZmcHJXd2R0Q1BHTkdoenByRmFKWndSQUBtYWlsLmdt
YWlsLmNvbS9ULyN0Cj4gCj4gUGxlYXNlIGluY2x1ZGUgdGhpcyBleHRyYSBwYXRjaCBpbiB5b3Vy
IG5leHQgc2VyaWVzIHBvc3RpbmcuCgpObyBwcm9ibGVtLiBBcHBsaWVkIG9uIHRvcCBvZiBteSBm
YW5vdGlmeV9kaXJlbnQgYnJhbmNoIChhYm92ZSkuCgotLSAKTWF0dGhldyBCb2Jyb3dza2kKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
