Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 082824CB6E
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 11:59:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D146B29897F
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 11:59:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 583032987A9
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 11:59:23 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BE799200E1A
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 11:59:22 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id a93so1187380pla.7
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CV+rOdgs7/olVBOg4xh2sAswn53R8zauEKGixZf20j8=;
 b=UzPLnVvvAaRS0y09NjR83lmDWG5SpVgBGBAgdVUZwPoHJp31wXohVqOyyUaBzaYXp9
 PmAWfplYZA8qjge3RYhchC79qKR+2kU8Q5pziPQ57qOsRMroKrOwDpN62JANr5fo00Qv
 EQfi9cUG1bEeZZXZnWc0wHdjqpSp3cK6TvW7uiw2Fhew5PZoObMwJl2SzvqrWE2gCWI1
 InfBw9WMNY08OP1mx0lwgWYHHbjp/ykB3QONL4Dr2XedEk5Xx+xBMNiQQdozIB6rNvTL
 Nc80/c8i3pLpPASeQFEIa9WyZ456oMd7ZIkh7EBcu/Ooz9jY9eO3NRf/1C4SkVSzZaCY
 YdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CV+rOdgs7/olVBOg4xh2sAswn53R8zauEKGixZf20j8=;
 b=WirhJceLBjnBIY03uel3oMlzPJ/2Pq1vMUwt1Y2/7pkMdEI3EXNaMCtX3k+tp8gbbf
 zG5N1WOnQX85zALzW8wfIefNLWbII3QtgRDFLSzjkagEcHlHzMl6DZGkVnRuGl22QkZg
 AS6CKw3U/E3xOdXk44MWIEJFx2ngxdeXWQMHjo/cWWF9VeY8f7TyexmLJ0K/r7zlyafB
 ixj/6JNCDLj5MdiyVFaZTKqsMshQQzwKtXDzAu56zwpJPpuYEyhsjTTSt7FYcQxDrdrq
 7GK4FU5FXX1zOzMb+2GT7zJ0aszY3Wfss54NnGqY064qK71AGDb2B3xkt0c+auaWI3Lk
 DhPA==
X-Gm-Message-State: APjAAAVptZMm2ZnbD/W53Jd9Bvv0/7eCbYbGLNHLB9Au8VD9G+oGGON0
 XinzDJ7msLGJI/o1KXkREsgp2Xv2Gw==
X-Google-Smtp-Source: APXvYqzmqSCwuq9kduSVb5bpiHZ/hvdTJunk2V1n3QeTLRuAyihCu1I2v156sgeOEFsVfTtxlvBt1A==
X-Received: by 2002:a17:902:2ac1:: with SMTP id
 j59mr51460997plb.156.1561024760888; 
 Thu, 20 Jun 2019 02:59:20 -0700 (PDT)
Received: from neo.Home ([114.78.0.167])
 by smtp.gmail.com with ESMTPSA id 14sm24727319pfj.36.2019.06.20.02.59.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 02:59:20 -0700 (PDT)
From: Amir Goldstein <mbobrowski@mbobrowski.org>
X-Google-Original-From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 20 Jun 2019 19:59:14 +1000
To: ltp@lists.linux.it
Message-ID: <c35992aa401f2b2713a2c1619638b957266d254d.1561018312.git.mbobrowski@mbobrowski.org>
References: <cover.1561018312.git.mbobrowski@mbobrowski.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1561018312.git.mbobrowski@mbobrowski.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: jack@suse.cz
Subject: [LTP] [PATCH v5 4/4] syscalls/fanotify13: add test coverage for
 fsid cache bug
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

VGhpcyBidWcgd2FzIHJlcG9ydGVkIGJ5IHN5emJvdDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtZnNkZXZlbC9DQU9RNHV4aHNuT1hYVkN1T1Q0cDRjX2tvQk1GZnByV3dkdENQR05HaHpw
ckZhSlp3UkFAbWFpbC5nbWFpbC5jb20vVC8jdAoKU2lnbmVkLW9mZi1ieTogQW1pciBHb2xkc3Rl
aW4gPGFtaXI3M2lsQGdtYWlsLmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zh
bm90aWZ5L2Zhbm90aWZ5MTMuYyB8IDIwICsrKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkxMy5jCmluZGV4IDMzZWUyZjFjOC4uOGY5
YmFhY2ZhIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zh
bm90aWZ5MTMuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90
aWZ5MTMuYwpAQCAtODQsNiArODQsNyBAQCBzdGF0aWMgc3RydWN0IHRlc3RfY2FzZV90IHsKIAl9
CiB9OwogCitzdGF0aWMgaW50IG5vZmlkX2ZkOwogc3RhdGljIGludCBmYW5vdGlmeV9mZDsKIHN0
YXRpYyBjaGFyIGV2ZW50c19idWZbQlVGX1NJWkVdOwogc3RhdGljIHN0cnVjdCBldmVudF90IGV2
ZW50X3NldFtFVkVOVF9NQVhdOwpAQCAtMjgwLDIxICsyODEsMzIgQEAgb3V0OgogCiBzdGF0aWMg
dm9pZCBkb19zZXR1cCh2b2lkKQogewotCWludCBmZDsKLQogCS8qIENoZWNrIGZvciBrZXJuZWwg
ZmFub3RpZnkgc3VwcG9ydCAqLwotCWZkID0gU0FGRV9GQU5PVElGWV9JTklUKEZBTl9DTEFTU19O
T1RJRiwgT19SRE9OTFkpOwotCVNBRkVfQ0xPU0UoZmQpOworCW5vZmlkX2ZkID0gU0FGRV9GQU5P
VElGWV9JTklUKEZBTl9DTEFTU19OT1RJRiwgT19SRE9OTFkpOwogCiAJLyogQ3JlYXRlIGZpbGUg
YW5kIGRpcmVjdG9yeSBvYmplY3RzIGZvciB0ZXN0aW5nICovCiAJY3JlYXRlX29iamVjdHMoKTsK
IAorCS8qCisJICogQ3JlYXRlIGEgbWFyayBvbiBmaXJzdCBpbm9kZSB3aXRob3V0IEZBTl9SRVBP
UlRfRklELCB0byB0ZXN0CisJICogdW5pbml0aWFsaXplZCBjb25uZWN0b3ItPmZzaWQgY2FjaGUu
IFRoaXMgbWFyayByZW1haW5zIGZvciBhbGwgdGVzdAorCSAqIGNhc2VzIGFuZCBpcyBub3QgZXhw
ZWN0ZWQgdG8gZ2V0IGFueSBldmVudHMgKG5vIHdyaXRlcyBpbiB0aGlzIHRlc3QpLgorCSAqLwor
CWlmIChmYW5vdGlmeV9tYXJrKG5vZmlkX2ZkLCBGQU5fTUFSS19BREQsIEZBTl9DTE9TRV9XUklU
RSwgQVRfRkRDV0QsCisJCQkgIEZJTEVfUEFUSF9PTkUpID09IC0xKSB7CisJCXRzdF9icmsoVEJS
T0sgfCBURVJSTk8sCisJCQkiZmFub3RpZnlfbWFyayglZCwgRkFOX01BUktfQURELCBGQU5fQ0xP
U0VfV1JJVEUsICIKKwkJCSJBVF9GRENXRCwgIkZJTEVfUEFUSF9PTkUiKSBmYWlsZWQiLAorCQkJ
bm9maWRfZmQpOworCX0KKwogCS8qIEdldCB0aGUgZmlsZXN5c3RlbSBmc2lkIGFuZCBmaWxlIGhh
bmRsZSBmb3IgZWFjaCBjcmVhdGVkIG9iamVjdCAqLwogCWdldF9vYmplY3Rfc3RhdHMoKTsKIH0K
IAogc3RhdGljIHZvaWQgZG9fY2xlYW51cCh2b2lkKQogeworCVNBRkVfQ0xPU0Uobm9maWRfZmQp
OwogCWlmIChmYW5vdGlmeV9mZCA+IDApCiAJCVNBRkVfQ0xPU0UoZmFub3RpZnlfZmQpOwogfQot
LSAKMi4xNi40CgoKLS0gCk1hdHRoZXcgQm9icm93c2tpCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
