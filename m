Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CD71857D
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 08:45:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 271CF3EABE3
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 08:45:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 6BDA73EABBF
 for <ltp@lists.linux.it>; Thu,  9 May 2019 08:45:52 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F01A914060A4
 for <ltp@lists.linux.it>; Thu,  9 May 2019 08:45:49 +0200 (CEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x496bsF6073033
 for <ltp@lists.linux.it>; Thu, 9 May 2019 02:45:48 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2scckee1qq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Thu, 09 May 2019 02:45:47 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ltp@lists.linux.it> from <bala24@linux.vnet.ibm.com>;
 Thu, 9 May 2019 07:45:44 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 May 2019 07:45:42 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x496jfkh47972392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 May 2019 06:45:41 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71D8711C052;
 Thu,  9 May 2019 06:45:41 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D50F811C050;
 Thu,  9 May 2019 06:45:40 +0000 (GMT)
Received: from dhcp-9-109-247-167.in.ibm.com (unknown [9.124.35.91])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  9 May 2019 06:45:40 +0000 (GMT)
Date: Thu, 9 May 2019 12:15:35 +0530
From: Balamuruhan S <bala24@linux.vnet.ibm.com>
To: Li Wang <liwang@redhat.com>
References: <20190508084447.18191-1-liwang@redhat.com>
 <20190508084447.18191-2-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508084447.18191-2-liwang@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-TM-AS-GCONF: 00
x-cbid: 19050906-0028-0000-0000-0000036BD146
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050906-0029-0000-0000-0000242B510E
Message-Id: <20190509064535.GA6096@dhcp-9-109-247-167.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090043
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/2] libltpnuma: remove restrictions on numa
 node-id
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDQ6NDQ6NDdQTSArMDgwMCwgTGkgV2FuZyB3cm90ZToK
PiBGb3Igc29tZSBwcGM2NGxlIHN5c3RlbXMsIGl0IGhhcyBub24tY29udGludW91cyBudW1hIG5v
ZGVzIGluCj4gaGFyZHdhcmUgY29uZmlndXJhdGlvbi4gU28gd2UncmUgaGl0dGluZyB0aGUgYmVs
b3cgd2FybmluZ3Mgd2hpbGUKPiBydW5uaW5nIHNldF9tZW1wb2xpY3kgdGVzdHMgb24gdGhhdC4g
VG8gZml4IHRoaXMgaXNzdWUsIGxldCdzIGp1c3QKPiByZW1vdmUgcmVzdHJpY3Rpb25zIG9uIG51
bWEgbm9kZS1pZCBpbiBnZXRfbWVtcG9saWN5KCkuCj4gCj4gRXJyb3IgTG9nCj4gLS0tLS0tLS0t
Cj4gdHN0X3Rlc3QuYzoxMDk2OiBJTkZPOiBUaW1lb3V0IHBlciBydW4gaXMgMGggNTBtIDAwcwo+
IHRzdF9udW1hLmM6MTkwOiBJTkZPOiBGb3VuZCAyIE5VTUEgbWVtb3J5IG5vZGVzCj4gc2V0X21l
bXBvbGljeTAxLmM6NjM6IFBBU1M6IHNldF9tZW1wb2xpY3koTVBPTF9CSU5EKSBub2RlIDAKPiB0
c3RfbnVtYS5jOjI2OiBJTkZPOiBOb2RlIDAgYWxsb2NhdGVkIDE2IHBhZ2VzCj4gdHN0X251bWEu
YzoyNjogSU5GTzogTm9kZSA4IGFsbG9jYXRlZCAwIHBhZ2VzCj4gc2V0X21lbXBvbGljeTAxLmM6
ODI6IFBBU1M6IGNoaWxkOiBOb2RlIDAgYWxsb2NhdGVkIDE2Cj4gc2V0X21lbXBvbGljeTAxLmM6
NjM6IFBBU1M6IHNldF9tZW1wb2xpY3koTVBPTF9CSU5EKSBub2RlIDgKPiB0c3RfbnVtYS5jOjky
OiBXQVJOOiBnZXRfbWVtcG9saWN5KC4uLikgcmV0dXJuZWQgaW52YWxpZCBub2RlIDgKPiB0c3Rf
bnVtYS5jOjkyOiBXQVJOOiBnZXRfbWVtcG9saWN5KC4uLikgcmV0dXJuZWQgaW52YWxpZCBub2Rl
IDgKPiB0c3RfbnVtYS5jOjkyOiBXQVJOOiBnZXRfbWVtcG9saWN5KC4uLikgcmV0dXJuZWQgaW52
YWxpZCBub2RlIDgKPiAuLi4KPiB0c3RfbnVtYS5jOjI2OiBJTkZPOiBOb2RlIDAgYWxsb2NhdGVk
IDAgcGFnZXMKPiB0c3RfbnVtYS5jOjI2OiBJTkZPOiBOb2RlIDggYWxsb2NhdGVkIDAgcGFnZXMK
PiBzZXRfbWVtcG9saWN5MDEuYzo4NjogRkFJTDogY2hpbGQ6IE5vZGUgOCBhbGxvY2F0ZWQgMCwg
ZXhwZWN0ZWQgMTYKPiAKPiBsc2NwdQo+IC0tLS0tCj4gQXJjaGl0ZWN0dXJlOiAgICAgICAgcHBj
NjRsZQo+IC4uLgo+IENQVShzKTogICAgICAgICAgICAgIDEyOAo+IENvcmUocykgcGVyIHNvY2tl
dDogIDE2Cj4gU29ja2V0KHMpOiAgICAgICAgICAgMgo+IE5VTUEgbm9kZShzKTogICAgICAgIDIK
PiBNb2RlbCBuYW1lOiAgICAgICAgICBQT1dFUjksIGFsdGl2ZWMgc3VwcG9ydGVkCj4gLi4uCj4g
TlVNQSBub2RlMCBDUFUocyk6ICAgMC02Mwo+IE5VTUEgbm9kZTggQ1BVKHMpOiAgIDY0LTEyNwo+
IAo+IFNpZ25lZC1vZmYtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgo+IENjOiBDeXJp
bCBIcnViaXMgPGNocnViaXNAc3VzZS5jej4KPiAtLS0KPiAgbGlicy9saWJsdHBudW1hL3RzdF9u
dW1hLmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYnMvbGlibHRwbnVtYS90c3RfbnVtYS5jIGIv
bGlicy9saWJsdHBudW1hL3RzdF9udW1hLmMKPiBpbmRleCAwYmE2ZGFmMzkuLjU2Yzg2NDBmZiAx
MDA2NDQKPiAtLS0gYS9saWJzL2xpYmx0cG51bWEvdHN0X251bWEuYwo+ICsrKyBiL2xpYnMvbGli
bHRwbnVtYS90c3RfbnVtYS5jCj4gQEAgLTg4LDggKzg4LDkgQEAgdm9pZCB0c3Rfbm9kZW1hcF9j
b3VudF9wYWdlcyhzdHJ1Y3QgdHN0X25vZGVtYXAgKm5vZGVzLAo+ICAJCWlmIChyZXQgPCAwKQo+
ICAJCQl0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAiZ2V0X21lbXBvbGljeSgpIGZhaWxlZCIpOwo+
ICAKPiAtCQlpZiAobm9kZSA8IDAgfHwgKHVuc2lnbmVkIGludClub2RlID49IG5vZGVzLT5jbnQp
IHsKPiAtCQkJdHN0X3JlcyhUV0FSTiwgImdldF9tZW1wb2xpY3koLi4uKSByZXR1cm5lZCBpbnZh
bGlkIG5vZGUgJWlcbiIsIG5vZGUpOwo+ICsJCWlmIChub2RlIDwgMCkgewoKSXQgaXMgYmV0dGVy
IHRvIGhhdmUgY2hlY2sgZm9yIHBvd2VycGMgYW5kIHJlbW92ZSByZXN0cmljdGlvbiBhcyBpdCB3
aWxsCnN0aWxsIGhvbGQgZ29vZCBmb3Igb3RoZXIgYXJjaC4KCi0tIEJhbGEKCj4gKwkJCXRzdF9y
ZXMoVFdBUk4sCj4gKwkJCQkiZ2V0X21lbXBvbGljeSguLi4pIHJldHVybmVkIGludmFsaWQgbm9k
ZSAlaVxuIiwgbm9kZSk7Cj4gIAkJCWNvbnRpbnVlOwo+ICAJCX0KPiAgCj4gLS0gCj4gMi4yMC4x
Cj4gCj4gCj4gLS0gCj4gTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
