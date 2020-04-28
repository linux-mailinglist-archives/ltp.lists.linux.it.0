Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A52A1BB651
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 08:14:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA33A3C2848
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 08:14:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 27C3A3C2832
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 08:14:29 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3585E20007F
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 08:14:29 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id a5so676747pjh.2
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 23:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=XKXsYomeAs1qgdW5KPKYQwnZ+haS5zKJuANxKBNzX18=;
 b=FDP0rG8pVsctSS6ZDnH+EXJ9naE6KfJ4F08mFMSSqMPs6flkIFaGXb8P4FWabRRNX8
 d2QXDAd63G9eDyXPpKYDpaDG1zMbyTKr5mnM5MOrBTiDi/NfO6Q7KeCsn2+8ijdYckz+
 C3ZBG/C4+v3umS8DECxUC/IA+mW1EjvaP6vIm/jjxLkmzmmYi6m/bVfz9R4kPsiWQJsS
 Spnph2yWsTeekO8rVdFWmna9OqeF/ioVi2DDBI/IdrVWsJNjV3xUH0dO2mQQlWnW5vgk
 hBjKkuy016o6P4u7whQYrVw0X7xtfPVuXLK+eGs2FSse8AlVIt7h+4h4lcKPhO2IBYsC
 0mFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=XKXsYomeAs1qgdW5KPKYQwnZ+haS5zKJuANxKBNzX18=;
 b=aBTJ7XTzO2IOgs8xuUDRsGIVjOqCrqidHQ/LpsD2URx7MJJZI27mx9BJhC8CSnpfRn
 5NYO87fpryzOzXsMf0Q0Z9nQCjTD9HAPP0P8GhUhRiaqnNvJWD+GZE48kjxMT1rcN7p1
 CtBC5MQgxtnbgUcELJ85ZgCfg5E467tBAblGWdsEtN7m8m7eq3rD0VxqXvKmopsTQbeV
 m+QM8qEljiUtuiDnInYvcZj4sf7HrzCBZrbN8JU5vlVuMOwJIKCIhFOdSKY6vAC1Z1hy
 z55ccfs8AISUuC+1p0C7g8GKMipaIMGg8JUT2KYsqThedwd+kOqEPcMCYgp2P0Mt7O/0
 DN6g==
X-Gm-Message-State: AGi0PuZAHCu2HimSR2FWPis67DRdxxklfP7fHFGRrElfo3O8G+JoTcIx
 ZOR04G4p3a1MyuuB65sHLIiNjulookA=
X-Google-Smtp-Source: APiQypLZJOBTY7XXmOpjowjUiSwzs5x14duFBZVhy2YtPu7Lz81TgT0HbgZTInLvY4+V1HnR3+/Maw==
X-Received: by 2002:a17:90a:e608:: with SMTP id
 j8mr3196476pjy.44.1588054467424; 
 Mon, 27 Apr 2020 23:14:27 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id c80sm13918754pfb.82.2020.04.27.23.14.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 23:14:26 -0700 (PDT)
Date: Tue, 28 Apr 2020 11:44:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Message-ID: <20200428061424.fj4mq676aoosoqyw@vireshk-i7>
References: <20200427145212.GA5678@dell5510>
 <90ea553dfdea21683c517a7f47b2a5d3c2dba77f.1588050000.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90ea553dfdea21683c517a7f47b2a5d3c2dba77f.1588050000.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] common_timers: staticize all definitions
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMjgtMDQtMjAsIDEwOjMwLCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gU3RhdGljaXplIGFsbCB2
YXJpYWJsZSBhbmQgZnVuY3Rpb24gZGVmaW5pdGlvbnMgdG8gYXZvaWQgYnVpbGQgZmFpbHVyZXMK
PiBpbiB0aGUgZnV0dXJlIGlmIHRoaXMgZ2V0cyBpbmNsdWRlZCBieSBtdWx0aXBsZSBmaWxlcy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3Jn
Pgo+IC0tLQo+ICBpbmNsdWRlL2xhcGkvY29tbW9uX3RpbWVycy5oIHwgOCArKysrLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xhcGkvY29tbW9uX3RpbWVycy5oIGIvaW5jbHVkZS9sYXBpL2NvbW1v
bl90aW1lcnMuaAo+IGluZGV4IGRmNDE5NmVlYjU3OS4uZDJkMGQwZGFiNWZkIDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvbGFwaS9jb21tb25fdGltZXJzLmgKPiArKysgYi9pbmNsdWRlL2xhcGkvY29t
bW9uX3RpbWVycy5oCj4gQEAgLTE1LDcgKzE1LDcgQEAKPiAgI2RlZmluZSBOU0VDX1BFUl9TRUMg
KDEwMDAwMDAwMDBMKQo+ICAjZW5kaWYKPiAgCj4gLWNsb2NrX3QgY2xvY2tfbGlzdFtdID0gewo+
ICtzdGF0aWMgY2xvY2tfdCBjbG9ja19saXN0W10gPSB7Cj4gIAlDTE9DS19SRUFMVElNRSwKPiAg
CUNMT0NLX01PTk9UT05JQywKPiAgCUNMT0NLX1BST0NFU1NfQ1BVVElNRV9JRCwKPiBAQCAtMzQs
NyArMzQsNyBAQCBjbG9ja190IGNsb2NrX2xpc3RbXSA9IHsKPiAgCWNhc2UgZGVmX25hbWU6CQlc
Cj4gIAkJcmV0dXJuICNkZWZfbmFtZTsKClVuZm9ydHVuYXRlbHkgdGhpcyBzdGlsbCBnZW5lcmF0
ZXMgd2FybmluZzoKCndhcm5pbmc6IOKAmGNsb2NrX2xpc3TigJkgZGVmaW5lZCBidXQgbm90IHVz
ZWQKCkkgbWlzc2VkIHNlZWluZyB0aGlzIGVhcmxpZXIgaW4gdGhlIGZ1bGwgYnVpbGQgYW5kIHNh
dyBpdCBub3cgd2hpbGUKYnVpbGRpbmcgYSBzaW5nbGUgdGVzdCBjYXNlLgoKSSB0aGluayB3ZSBu
ZWVkIHRvIG1vdmUgdGhpcyB0byBzb21lIC5jIGZpbGUgYW5kIHJlbW92ZSB0aGUgInN0YXRpYyIK
cGFydC4gQnV0IEkgYW0gbm90IHN1cmUgd2hpY2ggb25lIHRvLiBJZiB3ZSBkbyB0aGF0LCB0aGVu
IHJlc3Qgb2YgdGhlCnNlcmllcyB3aWxsIG5vdCBiZSBhZmZlY3RlZCBieSBpdC4KCk9yIHdlIGNh
biBzaW1wbHkgZHJvcCB0aGUgInN0YXRpYyIgcGFydCBhbmQgbXVsdGlwbGUgY29waWVzIG9mIHRo
aXMKd2lsbCBiZSBwcmVzZW50IGluIGRpZmZlcmVudCAuYyBmaWxlcy4gV2hpY2ggSSBkb24ndCBy
ZWFsbHkgbGlrZSB0byBiZQpob25lc3QuCgotLSAKdmlyZXNoCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
