Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB393E91C7
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 14:45:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B7A53C701A
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 14:45:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 656DA3C5D9E
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 14:45:05 +0200 (CEST)
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 04ED5601410
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 14:45:03 +0200 (CEST)
X-QQ-mid: bizesmtp33t1628685897t9xhua14
Received: from [10.4.23.179] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 11 Aug 2021 20:44:57 +0800 (CST)
X-QQ-SSF: 0040000000200020B000000B0000000
X-QQ-FEAT: nRXnH7lDr4d84iNJWMTVz+Y5XKMvPGjDmWoJwJvCYLvkW5384PLmCQZLj5bMD
 dmNfeo7AorbVLe88f4f7mAWXMSvt3y2oYIstUXWWqY7UyadTnDXj8QMlFD4WotDTc9lWEqv
 1hyAY3UJZtWybDKzqrQEGix5xtPjycmLWSMSK3rj8d+5LrhNCo2hpzwQYlQrlAq7QI4cCRq
 3Etyohhq2XKpqZpmSJF0m3ZZ8aaSfcq5DaO/LzBFIxevtYlQF+bv6VwR42BY1zVA2KHQaFo
 LIWIt2YP/tcKnIZm4IpOI5WsYoD+u1iUi6Yu3A8dvUtPiDqRD6fnyJB16P27SvWOBmGvVVC
 ljzpC9ddM8dZyB/oEw=
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210811024816.18003-1-sujiaxun@uniontech.com>
 <YROx25iLltvuTKA8@yuki>
From: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <f2913da8-89b5-9f34-b0fe-3ddb8534f922@uniontech.com>+9AA58A9C9092FFC8
Date: Wed, 11 Aug 2021 20:44:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YROx25iLltvuTKA8@yuki>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [v3,
 2/6] syscalls/sysfs: Convert sysfs02 to the new API
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

T2theSB0aGFuayB5b3UuCgrU2iAyMDIxLzgvMTEgz8LO5zc6MTcsIEN5cmlsIEhydWJpcyDQtLXA
Ogo+IEhpIQo+IEkndmUgcHVzaGVkIHRoZSBzeXNmczAyIGFuZCBzeXNmczA0IHdpdGggYSBtaW5v
ciBjaGFuZ2VzLCB0aGFua3MuCj4gCj4gVGhlIHN5c2ZzMDEgYW5kIHN5c2ZzMDMgaGF2ZSB0byB3
YWl0IGZvciB0aGUgY2hhbmdlIGluCj4gVFNUX0VYUF9QT1NJVElWRSgpLgo+IAoKLS0gCktpbmQg
cmVnYXJkcywKCnN1amlheHVuCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
