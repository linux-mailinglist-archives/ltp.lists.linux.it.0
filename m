Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 872333E1188
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 11:41:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD7B03C7F54
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 11:41:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 172593C5EA4
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 11:41:29 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg704.qq.com [203.205.195.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2F800600F1E
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 11:41:27 +0200 (CEST)
X-QQ-mid: bizesmtp41t1628156481tr129l9d
Received: from [192.168.31.178] (unknown [180.110.162.144])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 05 Aug 2021 17:41:20 +0800 (CST)
X-QQ-SSF: 0040000000200020B000000A0000000
X-QQ-FEAT: 8UQpRCt8hdYjOaE6bEru0ZsRsZO4Ge7wUodgpp/gt3dZ+x/YvBD02Eb/Xz1Hd
 K29QqDTUHe3LugR6NS7TVytvoODoFWqqjUsgZxewflRKTLshJmJU7t0HDuAnEpKwQbhvYl0
 mjtiDkOk/x3PafeYVe9B9W6tt/gAJhv2GO8VZTK07F9M/8Qr5vt6qlX1x8QvGwpJ+8n3UDT
 dtjjwngRCXlis2xsoPzu9ZrCvZ0fCagsS7In2okGUvRGRs4SETAlrlRZ1VbCI3eEP97Q11W
 gCDH26vGLQbcV/K0d4td1pkjw7GETta1VqK/hrGykn97vqfTVCFCDvjLzyDT91ZT7JvKRu8
 B/yy5wW
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210805062812.7363-1-zhanglianjie@uniontech.com>
 <YQuxn5BTaEBKw4/v@yuki>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <50d2c17f-bfd8-0ce9-2c25-bb30521709f3@uniontech.com>+58910C767557FFCC
Date: Thu, 5 Aug 2021 17:41:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQuxn5BTaEBKw4/v@yuki>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] include/tst_test: Expose tst_tmpdir and tst_rmdir
 to newlib tests.
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T2ggaSBzZWUsIHRoYW5rIHlvdS4KCtTaIDIwMjEvOC81IDE3OjM4LCBDeXJpbCBIcnViaXMg0LS1
wDoKPiBIaSEKPiBUaGUgdGVzdCB0ZW1wb3JhcnkgdGVtcG9yYXJ5IGRpcmVjdG9yeSBpcyBjcmVh
dGVkIGluIHRoZSB0ZXN0IGxpYnJhcnkKPiB3aGVuIHRoZSAubmVlZHNfdG1wZGlyIGZsYWcgaXMg
c2V0IGFuZCB0aGVzZSBmdW5jdGlvbnMgYXJlIG5vdCBleHBvcnRlZAo+IHRvIG5ldyBsaWJyYXJ5
IEFQSSBmb3IgdGhpcyByZWFzb24uCj4gCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
