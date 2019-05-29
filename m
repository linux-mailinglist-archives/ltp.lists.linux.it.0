Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB422DC31
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 13:51:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F34B3EA351
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 13:51:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5A2DC3EA18F
 for <ltp@lists.linux.it>; Wed, 29 May 2019 13:51:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 11BAC60007E
 for <ltp@lists.linux.it>; Wed, 29 May 2019 13:51:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4D780AE2C;
 Wed, 29 May 2019 11:51:50 +0000 (UTC)
Date: Wed, 29 May 2019 13:51:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sandeep Patil <sspatil@android.com>
Message-ID: <20190529115149.GA569@rei.lan>
References: <20190519003808.47425-1-sspatil@android.com>
 <20190519003808.47425-6-sspatil@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190519003808.47425-6-sspatil@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 5/5] syscalls/bind01: convert to new library.
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

SGkhClVuZm9ydHVuYXRlbGx5IHRoaXMgZG9lcyBub3QgYXBwbHkgY2xlYW5seSBhZnRlcjoKCmNv
bW1pdCBmYTZhNGU3MDg0OTVkOTE3N2VjYTM5NTcxN2ViYWI0ZWU5YWZkOGQ2CkF1dGhvcjogUGV0
ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+CkRhdGU6ICAgVHVlIEFwciAyMyAyMTozODoyMyAyMDE5
ICswMjAwCgogICAgbmV0OiBJbnRyb2R1Y2UgVFNUX0dFVF9VTlVTRURfUE9SVCgpIG1hY3JvIGlu
dG8gQyBBUEkKCgpDYW4geW91IHBsZWFzZSByZWJhc2UgeW91ciBjb21taXQ/CgotLSAKQ3lyaWwg
SHJ1YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
