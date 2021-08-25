Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 729573F6D02
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 03:16:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A32583C7AF9
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 03:16:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9C5153C3181
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 03:16:34 +0200 (CEST)
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A1EB81000455
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 03:16:31 +0200 (CEST)
X-QQ-mid: bizesmtp44t1629854181tcw7wgyb
Received: from [10.4.23.179] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 25 Aug 2021 09:16:20 +0800 (CST)
X-QQ-SSF: 0040000000200020B000B00A0000000
X-QQ-FEAT: q17Yoz/cMVpLn/h6YCGaUVmTjGBOVTxHdB13IeTqg3SOF7PVhI665hzwdBFcZ
 E5J+OnG8g0JG7gGb33jE1n9bdatkzhDDZeo1Hun6Yz1x7vToDWz5qNAck/dkV4mX+RabhhV
 pfNZAL4HHWdYWaAaC/N1rC6QbU+qvXvyXG98MYR8QdmXcT67nei5WzfGTnb1L5JBA8GIUii
 uXkf4Pe9Fb5tXnxG33kTL5pPBXZ04EYwpsBxaCreplQbLJTnMWW42xhHUNUblDNlh+gBXIf
 i1i587TpyS6jhHmh+W3D4Enh9gVIvPN+SxNdjVc1tY3fzaXRfgKebHXlM=
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210817011431.10648-1-sujiaxun@uniontech.com>
 <YST72qTrmOf+d3Ej@yuki>
From: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <ff3e3fdb-2f5a-82d8-aee0-c9378a8b8b25@uniontech.com>+21AE4FCC3E5A9E72
Date: Wed, 25 Aug 2021 09:16:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YST72qTrmOf+d3Ej@yuki>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.5 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/sync_file_range01: Convert to new API
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

CgrU2iAyMDIxLzgvMjQgz8LO5zEwOjAyLCBDeXJpbCBIcnViaXMg0LS1wDoKPiBIaSEKPiBQdXNo
ZWQgd2l0aCB0d28gbWlub3IgY2hhbmdlcywgdGhhbmtzLgo+IAo+IC0gcmV3cm90ZSB0aGUgdGVz
dCBkZXNjcmlwdGlvbiBhIGJpdAo+IC0gY2hhbmdlZCB0aGUgVFNUX0VYUF9GQUlMKCkgdG8gcHJp
bnQgbmljZXIgbWVzc2FnZQo+IApPa2F5LCB0aGFuayB5b3UgZm9yIGhlbHBpbmcgdG8gbW9kaWZ5
IGFuZCBtZXJnZS4KLS0gCktpbmQgcmVnYXJkcywKCnN1amlheHVuCgoKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
