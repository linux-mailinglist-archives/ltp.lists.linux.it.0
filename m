Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C0B23338
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 14:08:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD0952D0139
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 14:08:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id BF1D3294A8D
 for <ltp@lists.linux.it>; Mon, 20 May 2019 14:08:50 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BBABA200C97
 for <ltp@lists.linux.it>; Mon, 20 May 2019 14:08:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 00367AC70
 for <ltp@lists.linux.it>; Mon, 20 May 2019 12:08:48 +0000 (UTC)
Date: Mon, 20 May 2019 14:08:48 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190520120848.GA27675@rei.lan>
References: <20190423193823.4580-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190423193823.4580-1-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/1] net: Introduce TST_GET_UNUSED_PORT() macro
 into C API
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

SGkhCkxvb2tzIGdvb2QsIGFja2VkLgoKQnR3IHRoZSBsdHBhcGljbWQgaW1wbGVtZW50YXRpb24g
c2hvdWxkIGdldCBlaXRoZXIgcmVtb3ZlZCAoaW4gYSBjYXNlCnRoYXQgaXQgd2lsbCBiZSBubyBs
b25nZXIgdXNlZCkgb3Igd2Ugc2hvdWxkIGNvbnZlcnQgaXQgdG8gYSBzdGFuZGFsb25lCmhlbHBl
ciB0aGUgdGVzdGNhc2VzL2xpYi8gZGlyZWN0b3J5LiBCdXQgdGhhdCBpcyBzb21ldGhpbmcgdGhh
dCBzaG91bGQKYmUgZG9uZSBpbiBhIHNlcHJhdGUgcGF0Y2guLi4KCi0tIApDeXJpbCBIcnViaXMK
Y2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
