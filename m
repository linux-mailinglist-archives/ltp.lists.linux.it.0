Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C9B2F0B58
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 04:03:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6C2C3C6ACE
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 04:03:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E19833C042D
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 04:03:32 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D4945600672
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 04:03:31 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,337,1602518400"; d="scan'208";a="103350613"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Jan 2021 11:03:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4C0A04CE5CCA;
 Mon, 11 Jan 2021 11:03:26 +0800 (CST)
Received: from [10.167.226.45] (10.167.226.45) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 11 Jan 2021 11:03:27 +0800
To: yangx.jy <yangx.jy@cn.fujitsu.com>, Petr Vorel <pvorel@suse.cz>
References: <20210111012338.5482-1-lizhijian@cn.fujitsu.com>
 <5FFBAC5B.8060808@cn.fujitsu.com>
From: Li Zhijian <lizhijian@cn.fujitsu.com>
Message-ID: <c9c17cc2-27a6-cfc7-8d8c-899ca739072b@cn.fujitsu.com>
Date: Mon, 11 Jan 2021 11:03:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5FFBAC5B.8060808@cn.fujitsu.com>
Content-Language: en-US
X-Originating-IP: [10.167.226.45]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4C0A04CE5CCA.AAC32
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] build.sh: support compiler with path prefix
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpPbiAxLzExLzIxIDk6MzkgQU0sIHlhbmd4Lmp5IHdyb3RlOgo+IE9uIDIwMjEvMS8xMSA5OjIz
LCBMaSBaaGlqaWFuIHdyb3RlOgo+PiBQcmV2aW91c2x5LCBzcGVjaWZ5IGEgY29tcGlsZXIgd2l0
aCBwYXRoIHByZWZpeCB3aWxsIGxlYWQgdG8gYSBlcnJvcgo+PiBsaWtlIGJlbG93Ogo+PiBsdHAk
IC4vYnVpbGQuc2ggLXQgY3Jvc3MgLWMgL29wdC9nY2MtNC45LjMtNjQtZ251L2Jpbi9taXBzNjRl
bC1saW51eC1nY2MKPj4gLi4uCj4+IEl0IHdhcyBjcmVhdGVkIGJ5IGx0cCBjb25maWd1cmUgTFRQ
X1ZFUlNJT04sIHdoaWNoIHdhcwo+PiBnZW5lcmF0ZWQgYnkgR05VIEF1dG9jb25mIDIuNjkuwqAg
SW52b2NhdGlvbiBjb21tYW5kIGxpbmUgd2FzCj4+Cj4+IMKgwqAgJCAuL2NvbmZpZ3VyZSAtLXdp
dGgtb3Blbi1wb3NpeC10ZXN0c3VpdGUgLS13aXRoLXJlYWx0aW1lLXRlc3RzdWl0ZSAtLXByZWZp
eD0vaG9tZS9saXpqL2x0cC1pbnN0YWxsIC0taG9zdD0vb3B0L2djYy00LjkuMy02NC1nbnUvYmlu
L21pcHM2NGVsLWxpbnV4IENST1NTX0NPTVBJTEU9L29wdC9nY2MtNC45LjMtNjQtZ251L2Jpbi9t
aXBzNjRlbC1saW51eC0KPj4gLi4uCj4+IMKgICNkZWZpbmUgVkVSU0lPTiAiTFRQX1ZFUlNJT04i
Cj4+Cj4+IGNvbmZpZ3VyZTogZXhpdCAxCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IExpIFpoaWppYW48
bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPgo+PiAtLS0KPj4gwqAgYnVpbGQuc2ggfCAyICstCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvYnVpbGQuc2ggYi9idWlsZC5zaAo+PiBpbmRleCA0NTJjYzZmNGMuLmE2NjJj
OWNiNCAxMDA3NTUKPj4gLS0tIGEvYnVpbGQuc2gKPj4gKysrIGIvYnVpbGQuc2gKPj4gQEAgLTY0
LDcgKzY0LDcgQEAgYnVpbGRfY3Jvc3MoKQo+PiDCoMKgwqDCoMKgIGZpCj4+Cj4+IMKgwqDCoMKg
wqAgZWNobyAiPT09PT0gY3Jvc3MtY29tcGlsZSAke2hvc3R9ICR7MX0tdHJlZSBidWlsZCBpbnRv
ICRQUkVGSVggPT09PT0iCj4+IC3CoMKgwqAgYnVpbGQgJDEgJDIgIi0taG9zdD0kaG9zdCIgQ1JP
U1NfQ09NUElMRT0iJHtob3N0fS0iCj4+ICvCoMKgwqAgYnVpbGQgJDEgJDIgIi0taG9zdD0kKGJh
c2VuYW1lICRob3N0KSIgQ1JPU1NfQ09NUElMRT0iJHtob3N0fS0iCj4gSGkgUGV0ciwKPgo+IENS
T1NTX0NPTVBJTEUgc2VlbXMgdW5uZWVlZGVkLCByaWdodD8KSW5kZWVkLMKgIENST1NTX0NPTVBJ
TEUgd2FzIG5vIGxvbmdlciB1c2VkIHNpbmNlCjQwMGFjOWJiZTIwOiBidWlsZDogUmVtb3ZlIHtj
b25maWcuaCxjb25maWcubWssZmVhdHVyZXMubWssfS5kZWZhdWx0CgoKVGhhbmtzCgo+IE90aGVy
IHRoYW4gdGhhdCBpdCBsb29rcyBnb29kIHRvIG1lLgo+IFJldmlld2VkLWJ5OiBYaWFvIFlhbmcg
PHlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tPgo+Cj4gQmVzdCBSZWdhcmRzLAo+IFhpYW8gWWFuZwo+
PiDCoCB9Cj4+Cj4+IMKgIGJ1aWxkKCkKPgoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
