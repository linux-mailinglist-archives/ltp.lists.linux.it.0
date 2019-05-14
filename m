Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C74E1C924
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 15:02:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25F483EA2E2
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 15:02:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C7D283EA1BF
 for <ltp@lists.linux.it>; Tue, 14 May 2019 15:02:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 94B14601C67
 for <ltp@lists.linux.it>; Tue, 14 May 2019 15:02:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9D0E0AD51;
 Tue, 14 May 2019 13:02:36 +0000 (UTC)
Date: Tue, 14 May 2019 15:02:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jinhui huang <huangjh.jy@cn.fujitsu.com>
Message-ID: <20190514130234.GB31720@dell5510>
References: <1557711965-11638-1-git-send-email-huangjh.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557711965-11638-1-git-send-email-huangjh.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscall/ioctl: fix compiler error
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgSmluaHVpLAoKPiAiQ0xPTkVfTkVXUElEIiBhbmQgIkNMT05FX05FV1VTRVIiIGFyZSBub3Qg
ZGVmaW5lZCBvbiBzb21lIG9sZCBkaXN0cm9zLAo+IHNvIGluY2x1ZGUgImxhcGkvbmFtZXNwYWNl
c19jb25zdGFudHMuaCIgdG8gZml4IGl0LgoKQ2FuIHlvdSBiZSBtb3JlIHNwZWNpZmljLCB3aGlj
aCBkaXN0cm9zPwpDTE9ORV8qIGhhcyBiZWVuIGFkZGVkIGludG8gZ2xpYmMgaW4gMjAwOCAocmVs
ZWFzZWQgaW4gZ2xpYmMgMi44KS4KCj4gU2lnbmVkLW9mZi1ieTogSmluaHVpIGh1YW5nIDxodWFu
Z2poLmp5QGNuLmZ1aml0c3UuY29tPgpSZXZpZXdlZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1
c2UuY3o+CgpAQ3lyaWw6IHRoaXMgY291bGQgZ28gYmVmb3JlIHJlbGVhc2UgYXMgd2VsbC4KCktp
bmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
