Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7094EA0D
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 16:00:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 644FC3EAFF5
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 16:00:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 702FF3EA2BD
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 16:00:14 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2C9F42011CC
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 16:00:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5628AAE14;
 Fri, 21 Jun 2019 14:00:12 +0000 (UTC)
Date: Fri, 21 Jun 2019 16:00:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Matthew Bobrowski <mbobrowski@mbobrowski.org>
Message-ID: <20190621140009.GA26200@rei.lan>
References: <cover.1561018312.git.mbobrowski@mbobrowski.org>
 <98bc3a5d9591387964b913c497f930a11ea4f7a8.1561018312.git.mbobrowski@mbobrowski.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98bc3a5d9591387964b913c497f930a11ea4f7a8.1561018312.git.mbobrowski@mbobrowski.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: jack@suse.cz, ltp@lists.linux.it
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

SGkhCj4gKyNlbHNlCj4gKwlUU1RfVEVTVF9UQ09ORigiU3lzdGVtIGRvZXMgbm90IGhhdmUgcmVx
dWlyZWQgZmFub3RpZnkgc3VwcG9ydCIpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCQkJCQkJCUkndmUgYWRk
ZWQKCQkJCQkJCW1pc3NpbmcKCQkJCQkJCXNlbWljb2xvbiBoZXJlLgo+ICsjZW5kaWYKCkFuZCBh
cHBsaWVkIHdob2xlIHBhdGNoc2V0IHRvZ2V0aGVyIHdpdGggdGhlIGZpeCBmcm9tIEFtaXIuCgpU
aGFua3MuCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
