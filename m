Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5871E7E0
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 07:21:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80873294ADF
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 07:21:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 85041294AB3
 for <ltp@lists.linux.it>; Wed, 15 May 2019 07:21:35 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 5DC511A01727
 for <ltp@lists.linux.it>; Wed, 15 May 2019 07:21:32 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,471,1549900800"; d="scan'208";a="63098144"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 15 May 2019 13:21:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
 by cn.fujitsu.com (Postfix) with ESMTP id 54F454CDBF6F;
 Wed, 15 May 2019 13:21:28 +0800 (CST)
Received: from [10.167.215.28] (10.167.215.28) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 15 May 2019 13:21:29 +0800
Message-ID: <5CDBA1D1.9010002@cn.fujitsu.com>
Date: Wed, 15 May 2019 13:21:21 +0800
From: jinhui huang <huangjh.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <1557711965-11638-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <20190514130234.GB31720@dell5510>
In-Reply-To: <20190514130234.GB31720@dell5510>
X-Originating-IP: [10.167.215.28]
X-yoursite-MailScanner-ID: 54F454CDBF6F.ACA33
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangjh.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMjAxOS8wNS8xNCAyMTowMiwgUGV0ciBWb3JlbCB3cm90ZToKCkhpLAo+IEhpIEppbmh1aSwK
Pgo+PiAiQ0xPTkVfTkVXUElEIiBhbmQgIkNMT05FX05FV1VTRVIiIGFyZSBub3QgZGVmaW5lZCBv
biBzb21lIG9sZCBkaXN0cm9zLAo+PiBzbyBpbmNsdWRlICJsYXBpL25hbWVzcGFjZXNfY29uc3Rh
bnRzLmgiIHRvIGZpeCBpdC4KPiBDYW4geW91IGJlIG1vcmUgc3BlY2lmaWMsIHdoaWNoIGRpc3Ry
b3M/Cj4gQ0xPTkVfKiBoYXMgYmVlbiBhZGRlZCBpbnRvIGdsaWJjIGluIDIwMDggKHJlbGVhc2Vk
IGluIGdsaWJjIDIuOCkuCj4KVGhlIGtlcm5lbCB2ZXJzaW9uIGlzIDIuNi4xOC0zOTguZWw1IGFu
ZCB0aGUgZ2xpYmMgdmVyc2lvbiBpcyAKZ2xpYmMtMi41LTEyMy4KPj4gU2lnbmVkLW9mZi1ieTog
SmluaHVpIGh1YW5nPGh1YW5namguanlAY24uZnVqaXRzdS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBl
dHIgVm9yZWw8cHZvcmVsQHN1c2UuY3o+Cj4KPiBAQ3lyaWw6IHRoaXMgY291bGQgZ28gYmVmb3Jl
IHJlbGVhc2UgYXMgd2VsbC4KPgo+IEtpbmQgcmVnYXJkcywKPiBQZXRyCktpbmQgcmVnYXJkcywK
SmluaHVpCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
