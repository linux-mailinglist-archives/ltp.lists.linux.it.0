Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6521A08A8
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Apr 2020 09:52:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09BE93C2D80
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Apr 2020 09:52:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 9E52A3C0271
 for <ltp@lists.linux.it>; Tue,  7 Apr 2020 09:52:08 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 5FB601000DB9
 for <ltp@lists.linux.it>; Tue,  7 Apr 2020 09:52:05 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; d="scan'208";a="88605591"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 07 Apr 2020 15:51:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id ED60E50A996F;
 Tue,  7 Apr 2020 15:41:31 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 7 Apr 2020 15:51:53 +0800
To: "Zouwei (Samuel)" <zou_wei@huawei.com>, Cyril Hrubis <chrubis@suse.cz>
References: <1584586550-11668-1-git-send-email-zou_wei@huawei.com>
 <6fb895d9-0396-1ee7-429f-ab7ea3ebdf0d@cn.fujitsu.com>
 <C3CD0DF8AD11A84CB25A1426DE537C61E592EF19@dggeml524-mbx.china.huawei.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <00f8ecd4-7e8f-859f-8f5f-d7f68c103128@cn.fujitsu.com>
Date: Tue, 7 Apr 2020 15:51:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <C3CD0DF8AD11A84CB25A1426DE537C61E592EF19@dggeml524-mbx.china.huawei.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: ED60E50A996F.AE685
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?b?562U5aSNOiAgW1BBVENIXSBhaW9fZXJyb3IvMy0xLmM6IENh?=
 =?utf-8?q?ll_write_before_aio=5Ferror?=
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgem91CgpXZSBoYXZlIGEgZGlzY3Vzc2lvbiBhYm91dCBhaW9fcmV0dXJuL2Fpb19lcnJvciBp
biBbMV0uCkFzIEN5cmlsIHNhaWQgIkZvciB0aGUgb3BlbiBwb3NpeCB0ZXN0IHlvdSBoYXZlIHRv
IHJlYWQgdGhlIFBPU0lYIApzcGVjaWZpY2F0aW9uLApub3QgdGhlIG1hbnVhbHMgdGhhdCBkZXNj
cmliZSBob3cgdGhlIGludGVyZmFjZSBpcyBpbXBsZW1lbnRlZCBpbiBMaW51eC4iCgpzZWUgaHR0
cHM6Ly9wdWJzLm9wZW5ncm91cC5vcmcvb25saW5lcHVicy85Njk5OTE5Nzk5LwoKeW91IGNhbiBz
ZWFyY2ggYWlvX2Vycm9yLCBpdCBzYWlkICIKVGhlIGFpb19lcnJvcigpIGZ1bmN0aW9uIG1heSBm
YWlsIGlmOgogICAgIFtFSU5WQUxdCiAgICAgICAgIFRoZSBhaW9jYnAgYXJndW1lbnQgZG9lcyBu
b3QgcmVmZXIgdG8gYW4gYXN5bmNocm9ub3VzIG9wZXJhdGlvbiAKd2hvc2UgcmV0dXJuIHN0YXR1
cyBoYXMgbm90IHlldCBiZWVuIHJldHJpZXZlZC4iCiIKTm93LCBJIHRoaW5rIHdlIHNob3VsZCBr
ZWVwIG9sZCBjb2RlLiBCdXQgd2UgY2FuIGFkZCBhIG5ldyBjYXNlIAqjqDQtMS5jKXRvIHRlc3Qi
dGhlIGVycm9yIHN0YXR1cyBmb3IgYW4gYXN5bmNocm9ub3VzIEkvTyBvcGVyYXRpb24gaXMKdGhl
IGVycm5vIHZhbHVlIHRoYXQgd291bGQgYmUgc2V0IGJ5IHRoZWNvcnJlc3BvbmRpbmcgcmVhZCgp
LCB3cml0ZSgpLCBdIApmZGF0YXN5bmMoKSwgb3IgZnN5bmMoKSBvcGVyYXRpb24iLgoKQGN5cmls
LCB3aGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzPwoKWzFdaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wYXRjaC8xMjYxMjM5LwoKQmVzdCBSZWdhcmRzCllhbmcgWHUKPiBIaSBBbGwsCj4g
Cj4gRG9lcyB0aGlzIHBhdGNoIG5lZWQgdG8gYmUgdXBkYXRlZCBvciBtb2RpZmllZD8KPiAKPiBC
ZXN0IFJlZ2FyZHMKPiBab3UgV2VpCj4gCj4gLS0tLS3Tyrz+1K28/i0tLS0tCj4gt6K8/sjLOiBZ
YW5nIFh1IFttYWlsdG86eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbV0KPiC3osvNyrG85Dog
MjAyMMTqM9TCMjDI1SAxNjoxNQo+IMrVvP7IyzogWm91d2VpIChTYW11ZWwpIDx6b3Vfd2VpQGh1
YXdlaS5jb20+Cj4gs63LzTogbHRwQGxpc3RzLmxpbnV4Lml0Cj4g1vfM4jogUmU6IFtMVFBdIFtQ
QVRDSF0gYWlvX2Vycm9yLzMtMS5jOiBDYWxsIHdyaXRlIGJlZm9yZSBhaW9fZXJyb3IKPiAKPiBI
aSBab3UKPiAKPj4gSW4gdGhlIGNhc2UsIGlmIHRoZXJlIGlzIG5vIHdyaXRlL3JlYWQgb3BlcmF0
aW9uIGJlZm9yZSBhaW9fZXJyb3IsCj4+IGFpb19lcnJvciB3aWxsIGp1ZGdlIHRoYXQgdGhlIGN1
cnJlbnQgYXN5bmNocm9ub3VzIEkvTyBoYXMgYmVlbgo+PiBzdWNjZXNzZnVsbHkgY29tcGxldGVk
LCB0aGVuIHJldHVybiAwLCBjYXNlIGZhaWxlZC4KPj4KPj4gQWZ0ZXIgdGhlIHdyaXRlL3JlYWQg
b3BlcmF0aW9uIGlzIGFkZGVkLCBiZWNhdXNlIGFpb2NiLmFpb19yZXFwcmlvIGlzCj4+IC0xLCB0
aGUgd3JpdGUvcmVhZCBvcGVyYXRpb24gd2lsbCByZXR1cm4gLTEsIHNvIGFpb19lcnJvciB3aWxs
IGFsc28KPj4gcmV0dXJuIEVJTlZBTCBiZWNhdXNlIGl0IGRldGVjdHMgdGhhdCB0aGUgYXN5bmNo
cm9ub3VzIEkvTyBoYXMgbm90IGNvbXBsZXRlZCBzdWNjZXNzZnVsbHkuCj4gSSBoYXZlIHNlZW4g
Z2xpYmMgY29kZSBhYm91dCBhaW9fd3JpdGUgYW5kIGFpb19lcnIgZnVuY3Rpb24sIHlvdSBhcmUg
cmlnaHQuIFRoYW5rcyBmb3IgdGhlIGZpeC4KPiAKPiBMb29rcyBnb29kIHRvIG1lLgo+IFJldmll
d2VkLWJ5OiBZYW5nIFh1IDx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgo+IAo+IEJlc3Qg
UmVnYXJkcwo+IFlhbmcgWHUKPj4KPj4gcHM6Cj4+IGh0dHA6Ly9tYW43Lm9yZy9saW51eC9tYW4t
cGFnZXMvbWFuMy9haW9fZXJyb3IuMy5odG1sCj4+IFJFVFVSTiBWQUxVRQo+PiAgICAgICAgICBU
aGlzIGZ1bmN0aW9uIHJldHVybnMgb25lIG9mIHRoZSBmb2xsb3dpbmc6Cj4+ICAgICAgICAgICog
IEVJTlBST0dSRVNTLCBpZiB0aGUgcmVxdWVzdCBoYXMgbm90IGJlZW4gY29tcGxldGVkIHlldC4K
Pj4gICAgICAgICAgKiAgRUNBTkNFTEVELCBpZiB0aGUgcmVxdWVzdCB3YXMgY2FuY2VsZWQuCj4+
ICAgICAgICAgICogIDAsIGlmIHRoZSByZXF1ZXN0IGNvbXBsZXRlZCBzdWNjZXNzZnVsbHkuCj4+
ICAgICAgICAgICogIEEgcG9zaXRpdmUgZXJyb3IgbnVtYmVyLCBpZiB0aGUgYXN5bmNocm9ub3Vz
IEkvTyBvcGVyYXRpb24gZmFpbGVkLgo+PiAgICAgICAgICAgICBUaGlzIGlzIHRoZSBzYW1lIHZh
bHVlIHRoYXQgd291bGQgaGF2ZSBiZWVuIHN0b3JlZCBpbiB0aGUgZXJybm8KPj4gICAgICAgICAg
ICAgdmFyaWFibGUgaW4gdGhlIGNhc2Ugb2YgYSBzeW5jaHJvbm91cyByZWFkKDIpLCB3cml0ZSgy
KSwgZnN5bmMoMiksCj4+ICAgICAgICAgICAgIG9yIGZkYXRhc3luYygyKSBjYWxsLgo+PiBFUlJP
UlMKPj4gICAgICAgICAgRUlOVkFMIGFpb2NicCBkb2VzIG5vdCBwb2ludCBhdCBhIGNvbnRyb2wg
YmxvY2sgZm9yIGFuIGFzeW5jaHJvbm91cwo+PiAgICAgICAgICAgICAgICAgSS9PIHJlcXVlc3Qg
b2Ygd2hpY2ggdGhlIHJldHVybiBzdGF0dXMgKHNlZSBhaW9fcmV0dXJuKDMpKSBoYXMKPj4gICAg
ICAgICAgICAgICAgIG5vdCBiZWVuIHJldHJpZXZlZCB5ZXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFpvdSBXZWkgPHpvdV93ZWlAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgIC4uLi9vcGVuX3Bvc2l4
X3Rlc3RzdWl0ZS9jb25mb3JtYW5jZS9pbnRlcmZhY2VzL2Fpb19lcnJvci8zLTEuYyAgICAgIHwg
NSArKysrKwo+PiAgICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYg
LS1naXQKPj4gYS90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvY29uZm9ybWFuY2UvaW50
ZXJmYWNlcy9haW9fZXJyb3IvMy0xLgo+PiBjCj4+IGIvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVz
dHN1aXRlL2NvbmZvcm1hbmNlL2ludGVyZmFjZXMvYWlvX2Vycm9yLzMtMS4KPj4gYwo+PiBpbmRl
eCA5Y2NkYTA1Li4yYjJjNjViIDEwMDY0NAo+PiAtLS0KPj4gYS90ZXN0Y2FzZXMvb3Blbl9wb3Np
eF90ZXN0c3VpdGUvY29uZm9ybWFuY2UvaW50ZXJmYWNlcy9haW9fZXJyb3IvMy0xLgo+PiBjCj4+
ICsrKyBiL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9jb25mb3JtYW5jZS9pbnRlcmZh
Y2VzL2Fpb19lcnJvci8KPj4gKysrIDMtMS5jCj4+IEBAIC02NCw2ICs2NCwxMSBAQCBpbnQgbWFp
bih2b2lkKQo+PiAgICAJYWlvY2IuYWlvX3JlcXByaW8gPSAtMTsKPj4gICAgCWFpb2NiLmFpb19u
Ynl0ZXMgPSBCVUZfU0laRTsKPj4KPj4gKwlpZiAoYWlvX3dyaXRlKCZhaW9jYikgIT0gLTEpIHsK
Pj4gKyAgICAgICAgICAgICAgICBwcmludGYoVE5BTUUgIiBFcnJvciBhdCBhaW9fd3JpdGUoKTog
JXNcbiIsIHN0cmVycm9yKGVycm5vKSk7Cj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuIFBUU19G
QUlMOwo+PiArICAgICAgICB9Cj4+ICsKPj4gICAgCXJldCA9IGFpb19lcnJvcigmYWlvY2IpOwo+
Pgo+PiAgICAJaWYgKHJldCAhPSBFSU5WQUwpIHsKPj4gLS0KPj4gMi42LjIKPj4KPj4KPiAKPiAK
PiAKPiAKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
