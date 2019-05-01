Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 178B210369
	for <lists+linux-ltp@lfdr.de>; Wed,  1 May 2019 02:01:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6DBA3EACA1
	for <lists+linux-ltp@lfdr.de>; Wed,  1 May 2019 02:01:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id AE8FB3EA137
 for <ltp@lists.linux.it>; Wed,  1 May 2019 02:01:19 +0200 (CEST)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 346A71000CFE
 for <ltp@lists.linux.it>; Wed,  1 May 2019 02:01:16 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id 10so7869217pfo.5
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 17:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nW/Dwu8s9jUldm4o7DAX2LAD824k/WvKI8d3PqPpSe8=;
 b=OqM8sBZKlVeo+Lt7qWYrB/LabVndnSLwuH7ymoP3cy4cKVFTRYnNmy18CDXcCTIgsR
 2k0QtSqXBfHPkWgBmTGLdm4boEKoNBDPaeSWuleEzzMgvgnbUtyEqAxFXGZ96Ku/dE7e
 zOkJJUmyAoUKm8qCRRScCuM6uIcQ5pzIArsSl3v1LftMuMllGU+6OiC6Abql0Vz+Pd+r
 ro1tAbCWzUc+tQzuWr/p1rIuwqYuNI6MIbMAcQwhcxiO282aUwg9LYXadnh2HzF4hUSL
 YJbyfsMYf70FpPVdliTH+I4Ih3sbL2MCjbWxJ4Sxte/3TubqMpCSpgzo7BdCJ9dQCXr6
 rjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nW/Dwu8s9jUldm4o7DAX2LAD824k/WvKI8d3PqPpSe8=;
 b=VEn28YoWazIK1DT02EjdxLlNi2+Sq3bgRkAvWaEqYB3dQqeMjmn/m2MVAGAZA3qcqF
 rlAdBC/cGQfWpHjCp8NdyFWgkovFqGtSRrYEgpLmdT3svhqRkFKTWhc8KJkNBHKu/zxT
 5LJ6dDaVC16nkB0TlKQyeMsRAu86bpGEDABQmaaOlnqbHyNO2JLBvZByy8vwABKn63LR
 /uAD0bMG9zcGbyx22THoiN7v+kQFuBCxMfwgau6ykmDo+SUBlCikIF8/NbCnDMzkjWFr
 a6sNt2/ekN6Q+3spcpukkAoEd/PFBO3wus6pkFWxhvxB66pbL9/kMADYzIslXZJ2pX30
 Dpbw==
X-Gm-Message-State: APjAAAUZqehUmCcHFaO4oHBn1Yhqc8G0nEbzmJqC8UUK9ohxtwGFG0c+
 4IGOYtkTfsaRbWwZQkz0EAY=
X-Google-Smtp-Source: APXvYqw5siwEYBBBOWCgIPZcWAgs52DMFokCEj6tqDddxuyLtQHhPv5v2Jq/qqlFzyCQX3uZeiZ24w==
X-Received: by 2002:a65:51c9:: with SMTP id i9mr71349094pgq.187.1556668877304; 
 Tue, 30 Apr 2019 17:01:17 -0700 (PDT)
Received: from [192.168.20.7] (c-73-19-52-228.hsd1.wa.comcast.net.
 [73.19.52.228])
 by smtp.gmail.com with ESMTPSA id j19sm48890624pfh.41.2019.04.30.17.01.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 17:01:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
From: Enji Cooper <yaneurabeya@gmail.com>
In-Reply-To: <20190430141652.GD30997@rei.lan>
Date: Tue, 30 Apr 2019 17:01:16 -0700
Message-Id: <A2F65DDF-8CAF-4361-9313-06860370A74B@gmail.com>
References: <20190430133836.28400-1-chrubis@suse.cz>
 <20190430141652.GD30997@rei.lan>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mailer: Apple Mail (2.3445.104.8)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/2] testcases.mk: Fix libs/ path for out-of-tree
 build
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

Cj4gT24gQXByIDMwLCAyMDE5LCBhdCA3OjE2IEFNLCBDeXJpbCBIcnViaXMgPGNocnViaXNAc3Vz
ZS5jej4gd3JvdGU6Cj4gCj4gSGkhCj4gQm90aCBwdXNoZWQsIHRoYW5rcy4KCglUaGFuayB5b3Ug
Zm9yIGZpeGluZyB0aGlzIEN5cmlsIQpUYWtlIGNhcmUsCi1FbmppCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
