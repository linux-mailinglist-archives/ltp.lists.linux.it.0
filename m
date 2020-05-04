Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6541C3216
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 07:09:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35BB83C268D
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 07:09:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0181B3C2680
 for <ltp@lists.linux.it>; Mon,  4 May 2020 07:09:42 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 029291A00147
 for <ltp@lists.linux.it>; Mon,  4 May 2020 07:09:41 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id a32so3259648pje.5
 for <ltp@lists.linux.it>; Sun, 03 May 2020 22:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=gdHflkJ+GnVKs/J4/oxn9ErJJzIUe4FRXoxNVz8ExFs=;
 b=G7/1Etc5Lv82jdezzNDf204SLCyo+F9RMvzoydz/p6qvmOsSaf0HJ9D+OzUychYeYX
 pdbS9X/lEAvdClTLsFrBrn48P8obSKMvondObil4+1gBZJKEm3KQFXqZvPdH+ZM1UYbL
 dPwdWo6eymkE27baZuyYcg7AkaW9fMgMOuphe1HvNh0NvAZMBk+BnZab+Jv4u1IOP+1o
 PHvivXBkfrCJYFb4K++HvWcXOdfBv3ZY/c3BCuwgPPw1qmlh4Qb2WX0qQ2ouifpg6OV9
 qmdozDLZZnIhi+vCFjGYLNa/tC2SrQ4+SbPiLUYa4rtsYuK3Aq1Ry7qRyH87T2DEon3e
 Sugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=gdHflkJ+GnVKs/J4/oxn9ErJJzIUe4FRXoxNVz8ExFs=;
 b=PPbXOy5Bt/c+lfNBOT/vVt04WvnR5a6lyKlRRoQQtpYEJFfWsFLuV8VWo/b3DFeD9T
 LBLslQyaBf5070UZAfAb2VujqBtlgllGaEj1dFQTw5PmNY2cYfUx1LI/5cCocWCKyIKp
 Ic2KXooUKFvT9o21IL0ADAOZuSP2sBfsm1O27/auTfBxEb8Jwh4r42RUNPtGK3HV8PHQ
 WYnLqZOXkzCB0/Zw67/Y0VYiys7k/M+4xa790Cq7XR7SE6twNdQsvnbkh+2xmey27FB1
 b3YeITICB1v7BtJjy2XyVkyuihu4ldE+lJiVd9pxBeEPDQeOpCLEIb7kX/SFfYsktfAw
 PtGQ==
X-Gm-Message-State: AGi0PuZ7vYEjrktRfTsS3WCv7R++dEML18GBvAJxA7Re/RJfV67rsHVq
 a6X5JTvtnIrmKXxgdudIohrkZA==
X-Google-Smtp-Source: APiQypIWjRMd1LVZHUnGM1pvV+eipVs8Vb+T2LDRqv55c+4GkkTOdXdl42rVElMfaHZ6E9Fevuc6fQ==
X-Received: by 2002:a17:90a:de8d:: with SMTP id
 n13mr14357391pjv.173.1588568980132; 
 Sun, 03 May 2020 22:09:40 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id 1sm7815394pff.180.2020.05.03.22.09.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 May 2020 22:09:39 -0700 (PDT)
Date: Mon, 4 May 2020 10:39:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200504050937.oassdcfg4x5zh4nm@vireshk-i7>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMzAtMDQtMjAsIDE2OjU3LCBYaWFvIFlhbmcgd3JvdGU6Cj4gcGlkZmRfb3BlbigyKSB3aWxs
IHNldCBjbG9zZS1vbi1leGVjIGZsYWcgb24gdGhlIGZpbGUgZGVzY3JpcHRvciBhcyBpdAo+IG1h
bnBhZ2Ugc3RhdGVzLCBzbyBjaGVjayBjbG9zZS1vbi1leGVjIGZsYWcgYnkgZmNudGwoMikuCj4g
Cj4gQWxzbyBhdm9pZCBjb21waWxlciB3YXJuaW5nIGJ5IHJlcGxhY2luZyAobG9uZykgVFNUX1JF
VCB3aXRoIChpbnQpIHBpZGZkOgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBwaWRmZF9vcGVuMDEu
Yzo5Ogo+IHBpZGZkX29wZW4wMS5jOiBJbiBmdW5jdGlvbiDigJhydW7igJk6Cj4gLi4vLi4vLi4v
Li4vaW5jbHVkZS90c3RfdGVzdC5oOjc2OjQxOiB3YXJuaW5nOiBmb3JtYXQg4oCYJWnigJkgZXhw
ZWN0cyBhcmd1bWVudCBvZiB0eXBlIOKAmGludOKAmSwgYnV0IGFyZ3VtZW50IDUgaGFzIHR5cGUg
4oCYbG9uZyBpbnTigJkgWy1XZm9ybWF0PV0KPiAgICA3NiB8ICAgdHN0X2Jya18oX19GSUxFX18s
IF9fTElORV9fLCAodHR5cGUpLCAoYXJnX2ZtdCksICMjX19WQV9BUkdTX18pO1wKPiAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn4KPiAuLi8u
Li8uLi8uLi9pbmNsdWRlL3RzdF9zYWZlX21hY3Jvcy5oOjIyNDo1OiBub3RlOiBpbiBleHBhbnNp
b24gb2YgbWFjcm8g4oCYdHN0X2Jya+KAmQo+ICAgMjI0IHwgICAgIHRzdF9icmsoVEJST0sgfCBU
RVJSTk8sICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgfCAgICAgXn5+fn5+fgo+
IHBpZGZkX29wZW4wMS5jOjIwOjk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhTQUZF
X0ZDTlRM4oCZCj4gICAgMjAgfCAgZmxhZyA9IFNBRkVfRkNOVEwoVFNUX1JFVCwgRl9HRVRGRCk7
CgpUaGlzIGxvZyBpc24ndCB1c2VmdWwgYXMgdGhlIHdhcm5pbmcgc3RhcnRlZCBjb21pbmcgYWZ0
ZXIgeW91ciBjaGFuZ2UKb25seSBhbmQgbm90IGJlZm9yZS4KCj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4gU2lnbmVkLW9mZi1ieTog
WGlhbyBZYW5nIDx5YW5neC5qeUBjbi5mdWppdHN1LmNvbT4KPiAtLS0KPiAgLi4uL2tlcm5lbC9z
eXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29wZW4wMS5jICB8IDE4ICsrKysrKysrKysrKysrLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZk
X29wZW4wMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29w
ZW4wMS5jCj4gaW5kZXggOTNiYjg2Njg3Li4yOTNlOTNiNjMgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29wZW4wMS5jCj4gKysrIGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29wZW4wMS5jCj4gQEAgLTYs
MTcgKzYsMjcgQEAKPiAgICogQmFzaWMgcGlkZmRfb3BlbigpIHRlc3QsIGZldGNoZXMgdGhlIFBJ
RCBvZiB0aGUgY3VycmVudCBwcm9jZXNzIGFuZCB0cmllcyB0bwo+ICAgKiBnZXQgaXRzIGZpbGUg
ZGVzY3JpcHRvci4KPiAgICovCj4gKwo+ICsjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4gKyNpbmNs
dWRlIDx1bmlzdGQuaD4KPiArI2luY2x1ZGUgPGZjbnRsLmg+Cj4gICNpbmNsdWRlICJ0c3RfdGVz
dC5oIgo+ICAjaW5jbHVkZSAibGFwaS9waWRmZF9vcGVuLmgiCj4gIAo+ICBzdGF0aWMgdm9pZCBy
dW4odm9pZCkKPiAgewo+IC0JVEVTVChwaWRmZF9vcGVuKGdldHBpZCgpLCAwKSk7Cj4gKwlpbnQg
cGlkZmQgPSAwLCBmbGFnID0gMDsKCk5vbmUgb2YgdGhlc2UgbmVlZCB0byBiZSBpbml0aWFsaXpl
ZC4KCj4gKwo+ICsJcGlkZmQgPSBwaWRmZF9vcGVuKGdldHBpZCgpLCAwKTsKPiArCWlmIChwaWRm
ZCA9PSAtMSkKPiArCQl0c3RfYnJrKFRGQUlMIHwgVEVSUk5PLCAicGlkZmRfb3BlbihnZXRwaWQo
KSwgMCkgZmFpbGVkIik7CgpUaGlzIGNvdWxkIGhhdmUgYmVlbiB3cml0dGVuIGFzOgogICAgICAg
IFRFU1QocGlkZmQgPSBwaWRmZF9vcGVuKGdldHBpZCgpLCAwKSk7Cgo+ICsKPiArCWZsYWcgPSBT
QUZFX0ZDTlRMKHBpZGZkLCBGX0dFVEZEKTsKPiAgCj4gLQlpZiAoVFNUX1JFVCA9PSAtMSkKPiAt
CQl0c3RfYnJrKFRGQUlMIHwgVFRFUlJOTywgInBpZGZkX29wZW4oZ2V0cGlkKCksIDApIGZhaWxl
ZCIpOwo+ICsJU0FGRV9DTE9TRShwaWRmZCk7Cj4gIAo+IC0JU0FGRV9DTE9TRShUU1RfUkVUKTsK
PiArCWlmICghKGZsYWcgJiBGRF9DTE9FWEVDKSkKPiArCQl0c3RfYnJrKFRGQUlMLCAicGlkZmRf
b3BlbihnZXRwaWQoKSwgMCkgZGlkbid0IHNldCBjbG9zZS1vbi1leGVjIGZsYWciKTsKPiAgCj4g
IAl0c3RfcmVzKFRQQVNTLCAicGlkZmRfb3BlbihnZXRwaWQoKSwgMCkgcGFzc2VkIik7Cj4gIH0K
PiAtLSAKPiAyLjIxLjAKPiAKPiAKCi0tIAp2aXJlc2gKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
