Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D962B2F7EF2
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 16:08:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95ABE3C6A13
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 16:08:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AC6323C5441
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 16:08:22 +0100 (CET)
Received: from m13131.mail.163.com (m13131.mail.163.com [220.181.13.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 399A3140005D
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 16:08:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=TUj9k
 0vfD3JPpqBvRXjIB8yOQkY6SlNUbcc/rIOCPWI=; b=eP6ErCa6YBjb9AK/kkaEa
 7dMR56C2aeJ+MtH+oTKFPcTf9NvzdsFbfxkDXTNtPGg0U9zERjLJbGgEfPiPR6ot
 SFNqklVeyiIxV53NcL/Jxkex/czc8HAogitV0seNGkypqAQ17VIo8unlGsVty+a1
 8vWuyTEngitumCkXJKtgwc=
Received: from gengcixi$163.com ( [123.119.156.104] ) by
 ajax-webmail-wmsvr131 (Coremail) ; Fri, 15 Jan 2021 23:08:11 +0800 (CST)
X-Originating-IP: [123.119.156.104]
Date: Fri, 15 Jan 2021 23:08:11 +0800 (CST)
From: gengcixi <gengcixi@163.com>
To: "Cyril Hrubis" <chrubis@suse.cz>, "LTP List" <ltp@lists.linux.it>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20201118(ab4b390f)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
MIME-Version: 1.0
Message-ID: <24f76ed8.3b8a.1770696f290.Coremail.gengcixi@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: g8GowABXWILbrwFgsfxhAA--.13664W
X-CM-SenderInfo: 5jhqwuxl0lqiywtou0bp/xtbByhEboF0CPrgYlwACs0
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DKIM_INVALID,DKIM_SIGNED,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Holidays and LTP release
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
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpIaSBDeXJpbDoKCiBSZWNlbnRseSBJIHdhcyBmb3JiaWRlbiB0byB1c2UgZ21haWwuIHNvIEkg
aGF2YSB0byB1c2UgdGhpcyBlbWFpbCB0byBzZW5kIHlvdSBtZXNzYWdlLgoKQW5kIEkgd2FudCB0
byBrbm93IGRvZXMgdGhlIHJ0YzAyIHBhdGNoc2V0IGNhbiBtZXJnZWQgaW50byB0aGUgcmVsZWFz
ZaO/CgogSWYgbm8gYmlnIGVycm9yc6OsIHBsZWFzZSBoZWxwIHJldmlldyBhbmQgbWVyZ2Vko6x0
aGFua3OjoQoKIFsxXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbHRwL3Bh
dGNoLzIwMjEwMTExMDgzNzExLjE3MTU4NTEtMi1nZW5nY2l4aUBnbWFpbC5jb20vCiBbMl0gaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2x0cC9wYXRjaC8yMDIxMDExMTA4Mzcx
MS4xNzE1ODUxLTMtZ2VuZ2NpeGlAZ21haWwuY29tLwogWzNdIGh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9sdHAvcGF0Y2gvMjAyMTAxMTEwODM3MTEuMTcxNTg1MS00LWdlbmdj
aXhpQGdtYWlsLmNvbS8KCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
