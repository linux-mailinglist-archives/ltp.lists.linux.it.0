Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB0850758
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 12:11:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 11E283C1915
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 12:11:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id AC2FD3C0638
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 12:11:42 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 538DF6007AC
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 12:11:44 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id n2so6839047pgp.11
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 03:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YuwL1DaMIbeXJb22jQDo6QgJIbjQfIcI+FVkY03LmtY=;
 b=qFx0seBhKfqfzkVK+CpCQr4GVm/vAz2x+LvrVx9XKOwOb9jESapFbgBQuTqrYyjgU4
 T4QUBkKBQ+Pjwc4apBQm79gxvgr4P2UGUQRZW5L7l9o0KxYqdPwxS22TJKL+mZGz1M1Y
 6RhCtoOYbKuT2zRtAEZFBMvM9b64PtyFcFNIiZ3t4gz+2DEBTy/wqxKJOCLA8pfSVQvl
 3WWhfpGFFRBht2Op9TIHm7Ac9SxEOqOOuQEzLmMLVueNva26NbJyQ+t+CS1hM4ouSk9J
 nAFb8wf6B3swh3ghCfzb9x99uUtyyatAepamLliCMgWk17LJnaWnGH87UXmg1MlEtkXx
 qNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YuwL1DaMIbeXJb22jQDo6QgJIbjQfIcI+FVkY03LmtY=;
 b=HFMh4mlg5FUpR4LXY6xTxRChou1yU9JPEEBfQIArvYbHJyzJ3NJf+ACfaGX0BsUHLM
 4fB8jE+EnzgS968388LV6Bi9Hk6koSokuvTXuSNI0pA5QTF3glYq/rJS/jhO8hJ1d+PA
 ypqbjiPYo+mPw0j/1UIVyEo9L39Vd3N9CIPiVpCJgfMTwGgyGEB0FVszgYHgAH46nR/K
 nQTifHeLbJdBV8i+ZlrZSbnuxCua1DlN2H0lxYY4xIv58gonXq6pMzU1tEdAOx1GZS8k
 FTUydcR+RkKi3z0A5Zsk67SqubKOrcg6WUydaXk2eNU3aPJqpjVg24R1pYUcxMBfOUU6
 ek3g==
X-Gm-Message-State: APjAAAVYXPSxrEGGTvHyEmjUyRx9xapcbbRNDo3LcgEmrAPIqwDR/J8X
 LhkyGqGJ7au2pV/itw/hSSt8
X-Google-Smtp-Source: APXvYqwwzumth1xphxFpH0qPvSM2rxrWRGw7Qwqc3+lX3IDOacwZTAv+xVVoixkHjBv70WemZrLI1Q==
X-Received: by 2002:a63:7f07:: with SMTP id a7mr14936692pgd.26.1561371100130; 
 Mon, 24 Jun 2019 03:11:40 -0700 (PDT)
Received: from poseidon.Home ([114.78.0.167])
 by smtp.gmail.com with ESMTPSA id q63sm20353472pfb.81.2019.06.24.03.11.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 03:11:39 -0700 (PDT)
Date: Mon, 24 Jun 2019 20:11:33 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190624101131.GA4089@poseidon.Home>
References: <cover.1561018312.git.mbobrowski@mbobrowski.org>
 <98bc3a5d9591387964b913c497f930a11ea4f7a8.1561018312.git.mbobrowski@mbobrowski.org>
 <20190621140009.GA26200@rei.lan>
 <CAOQ4uxjUtmrAfjwxhSU3g3QJ-2Nk9795pdT=nd8Mza_ETo+_2g@mail.gmail.com>
 <20190624083844.GA29809@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624083844.GA29809@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v5 2/4] syscalls/fanotify14: new test to validate
 FAN_REPORT_FID interface return values
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTA6Mzg6NDRBTSArMDIwMCwgQ3lyaWwgSHJ1YmlzIHdy
b3RlOgo+IEhpIQo+ID4gSGkgQ3lyaWwsCj4gPiAKPiA+IHY1IHNlcmllcyBoYXMgNCBwYXRjaGVz
IGFuZCBJIG9ubHkgc2VlIHlvdSBhcHBsaWVkIHRoZSAzIGZpcnN0IHBhdGNoZXMuCj4gPiBUaGlz
IG9uZSB3YXMgbm90IGFwcGxpZWQ6Cj4gPiAKPiA+IHN5c2NhbGxzL2Zhbm90aWZ5MTM6IGFkZCB0
ZXN0IGNvdmVyYWdlIGZvciBmc2lkIGNhY2hlIGJ1Zwo+IAo+IExvb2tzIGxpa2UgdGhlIGxhc3Qg
b25lIGRpZG4ndCBtYWtlIGl0IHRvIG15IG1haWxib3gsIHRoZSBzZXJpZXMgZW5kcwo+IHdpdGgg
My80LCBzb3JyeSBJIGhhdmVuJ3Qgbm90aWNlZC4KPiAKPiBNYXR0aGV3IGNhbiB5b3UgcGxlYXNl
IHJlc2VuZCB0aGUgbGFzdCBvbmU/CgpJbnRlcmVzdGluZyBhcyB0byB3aHkgdGhhdCBuZXZlciBl
bmRlZCB1cCBjb21pbmcgdGhyb3VnaC4gQW55d2F5LCBBbWlyCmhhcyBzZW50IHRoZSBtaXNzaW5n
IHBhdGNoIHRocm91Z2ggdG8geW91LgoKLS0gCk1hdHRoZXcgQm9icm93c2tpCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
