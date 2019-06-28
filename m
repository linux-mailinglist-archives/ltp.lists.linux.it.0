Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC0B59872
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jun 2019 12:33:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1E2D3C1C82
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jun 2019 12:33:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 65F293C1815
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 12:32:58 +0200 (CEST)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 163731A016F8
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 12:32:55 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5SAWWN3020830
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 03:32:42 -0700
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Fri, 28 Jun 2019 03:32:21 -0700
To: <ltp@lists.linux.it>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <dc4e1e30-face-9039-db90-5a6dae2fc2ea@windriver.com>
Date: Fri, 28 Jun 2019 18:32:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] Bug Report: diotest4 fails on mips64
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Kkx0cDoqCgpsYXRlc3QgbWFzdGVyCgoKKktlcm5lbDoqCgpBZnRlciB2NS4xIEFSQ0g9bWlwczY0
CgoKKkVycm9yIGluZm86KgoKZGlvdGVzdDQgMTAgVEJST0sgOiBkaW90ZXN0NC5jOjM2ODogY2Fu
J3QgbW1hcCBmaWxlOiBJbnZhbGlkIGFyZ3VtZW50CmRpb3Rlc3Q0IDExIFRCUk9LIDogZGlvdGVz
dDQuYzozNjg6IFJlbWFpbmluZyBjYXNlcyBicm9rZW4KCgpJIHRoaW5rIHRoZSBmaXJzdCBhcmd1
bWVudCBvZiBtbWFwIGlzIGludmFsaWQuCgogwqDCoCA+c2htX2Jhc2UgPSAoY2hhciAqKSgoKGxv
bmcpc2JyaygwKSArIChzaG1zeiAtIDEpKSAmIH4oc2htc3ogLSAxKSk7CgogwqDCoCA+c2htX2Jh
c2UgPSBtbWFwKHNobV9iYXNlLCAweDEwMDAwMCwgUFJPVF9SRUFEIHwgUFJPVF9XUklURSwKCgpS
ZWdhcmRzLAoKLS1Ib25nemhpCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
