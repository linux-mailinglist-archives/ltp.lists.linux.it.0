Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3405C1E81C
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 08:03:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBC21294AC1
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 08:03:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3340F294A9F
 for <ltp@lists.linux.it>; Wed, 15 May 2019 08:03:22 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8F3E51001980
 for <ltp@lists.linux.it>; Wed, 15 May 2019 08:03:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 63CACAE8A;
 Wed, 15 May 2019 06:03:12 +0000 (UTC)
Date: Wed, 15 May 2019 08:03:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: jinhui huang <huangjh.jy@cn.fujitsu.com>
Message-ID: <20190515060310.GA3239@dell5510>
References: <1557711965-11638-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <20190514130234.GB31720@dell5510> <5CDBA1D1.9010002@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CDBA1D1.9010002@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

SGkgSmluaHVpLAoKPiA+ID4gIkNMT05FX05FV1BJRCIgYW5kICJDTE9ORV9ORVdVU0VSIiBhcmUg
bm90IGRlZmluZWQgb24gc29tZSBvbGQgZGlzdHJvcywKPiA+ID4gc28gaW5jbHVkZSAibGFwaS9u
YW1lc3BhY2VzX2NvbnN0YW50cy5oIiB0byBmaXggaXQuCj4gPiBDYW4geW91IGJlIG1vcmUgc3Bl
Y2lmaWMsIHdoaWNoIGRpc3Ryb3M/Cj4gPiBDTE9ORV8qIGhhcyBiZWVuIGFkZGVkIGludG8gZ2xp
YmMgaW4gMjAwOCAocmVsZWFzZWQgaW4gZ2xpYmMgMi44KS4KCj4gVGhlIGtlcm5lbCB2ZXJzaW9u
IGlzIDIuNi4xOC0zOTguZWw1IGFuZCB0aGUgZ2xpYmMgdmVyc2lvbiBpcyBnbGliYy0yLjUtMTIz
LgpUaGFua3MgZm9yIGluZm8sIG1lcmdlZCEKCktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
