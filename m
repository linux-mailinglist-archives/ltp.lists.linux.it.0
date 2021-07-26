Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D219B3D5538
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 10:22:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D5F63C9229
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 10:22:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 08DCB3C1C02
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 10:22:39 +0200 (CEST)
Received: from smtpbg511.qq.com (smtpbg511.qq.com [203.205.250.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 649EF100092B
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 10:22:36 +0200 (CEST)
X-QQ-mid: bizesmtp35t1627287750tfdhgjvo
Received: from [10.4.23.46] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 26 Jul 2021 16:22:29 +0800 (CST)
X-QQ-SSF: 01400000002000208000000B0000000
X-QQ-FEAT: PWyfT+jp+FtfXVexn9PfmHhQnBOQxIfxakp669kWVAh+eaWGAmTcoORPMLIxt
 ttYu4drBmNKvdq7oa5nVOl+6fonLtw/6x/73q9yhOw6o8QEytC6NBnr6z/z0YFWVOP8/SHz
 r9feTLZ8q10g2KJMGAqGk4ktztHVmYpDXcizj2wH01Gd3sNAfzV4/0mdFszm09BdgNv1zu9
 IP3EXclH8yzsMq43WkJdBaBmzcocDCAo6i9E0VXKUki18dLyMi6G3JdqTslM6RmGMD6F1sY
 CpFgdmoSPskrq57rBYKkOPTuBm939Y/EC/Z8QvmCROXMc4ZEN0zDuw4o3gLAA2aZJPmVj1c
 qWm7xDHiXd/tRcSIJo=
X-QQ-GoodBg: 2
To: Li Wang <liwang@redhat.com>
References: <20210726075540.11814-1-zhanglianjie@uniontech.com>
 <CAEemH2dmqb8EzS0mCuGEhV7_YbPN0dSfENTkDcuKx24404452A@mail.gmail.com>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <d38c9818-be22-2de6-2c10-607a3ceddc40@uniontech.com>+2D7A5EFD760AE589
Date: Mon, 26 Jul 2021 16:22:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2dmqb8EzS0mCuGEhV7_YbPN0dSfENTkDcuKx24404452A@mail.gmail.com>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.3 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [2/2] syscalls/memcpy01: Convert to new API
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgoKPiBIaSBMaWFuamllLAo+IAo+IEkgbWFkZSBzb21lIG1vZGlmaWNhdGlvbnMgYW5kIGFwcGxp
ZWQgdGhlIHBhdGNoZXMuCj4gCj4gIMKgICogYWRkIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyCj4g
IMKgICogYWRkIHN0YXRpYyBzdGF0ZW1lbnQgaW4gZnJvbnQgb2YgZnVuY3Rpb25zCj4gIMKgICog
Y29tbWVudHMgY29tYmluYXRpb24gJiBjbGVhbnVwCj4gIMKgICogcmVtb3ZlIHVudXNlZCBUQ0lE
IGtleXdvcmRzCj4gIMKgICogY29kZSBpbmRlbnQgaXNzdWVzCj4gCj4gLS0gCgpUaGFuayB5b3Ug
Zm9yIHlvdXIgZ3VpZGFuY2UsIEkgd2lsbCBwYXkgYXR0ZW50aW9uIHRvIHRoZXNlIGlzc3Vlcy4K
Ci0tIApSZWdhcmRzLApaaGFuZyBMaWFuamllCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
