Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 147D41E702
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 05:01:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E06E0294AE5
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 05:01:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 73E2A294AB4
 for <ltp@lists.linux.it>; Wed, 15 May 2019 05:01:41 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 380DE1401644
 for <ltp@lists.linux.it>; Wed, 15 May 2019 05:01:39 +0200 (CEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4F2pX0r165206
 for <ltp@lists.linux.it>; Tue, 14 May 2019 23:01:37 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sg8q6uvp3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Tue, 14 May 2019 23:01:36 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ltp@lists.linux.it> from <zohar@linux.ibm.com>;
 Wed, 15 May 2019 04:01:35 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 15 May 2019 04:01:32 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4F31VZY48824410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 May 2019 03:01:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C849F11C064;
 Wed, 15 May 2019 03:01:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B32E111C04C;
 Wed, 15 May 2019 03:01:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.80.87])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 May 2019 03:01:30 +0000 (GMT)
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Ignaz Forster <iforster@suse.de>
Date: Tue, 14 May 2019 23:01:19 -0400
In-Reply-To: <20190514121213.GA28655@dell5510>
References: <20190405165225.27216-1-pvorel@suse.cz>
 <20190514121213.GA28655@dell5510>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19051503-4275-0000-0000-00000334D944
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051503-4276-0000-0000-000038445B38
Message-Id: <1557889279.4581.14.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-15_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905150015
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Fabian Vogt <FVogt@suse.com>, linux-integrity@vger.kernel.org,
 Marcus Meissner <meissner@suse.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 0/3] LTP reproducer on broken IMA on overlayfs
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

T24gVHVlLCAyMDE5LTA1LTE0IGF0IDE0OjEyICswMjAwLCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhp
IE1pbWksIElnbmF6LAo+IAo+IE1pbWksIGNvdWxkIHlvdSBwbGVhc2UgaGF2ZSBhIHNlY29uZCBs
b29rIG9uIHRoaXMgWzRdIHBhdGNoc2V0PyBXZSd2ZSBoYWQgYQo+IGRpc2N1c3Npb24gYWJvdXQg
c2Vjb25kIHBhdGNoIFs1XSwgSSBjYW4gZHJvcCBpdCBpZiB5b3UgZG9uJ3QgbGlrZSBpdCwgYnV0
Cj4gdGhhdCdzIG5vdCBhIG1haW4gY29uY2VybiBhYm91dCB0aGlzIHRlc3QuIE1vcmUgaW1wb3J0
YW50IGlzIHdoZXRoZXIgdGhlCj4gdGVzdGNhc2UgbG9va3MgdmFsaWQgZm9yIHlvdS4gSXQncyBh
Ym91dCBvdmVybGF5ZnMgYnJva2VuIGluIElNQStFVk0sCj4gd2hpY2ggaXMgY3VycmVudGx5IGJy
b2tlbiBvbiBtYWlubGluZS4KClRoZSBmaXJzdCB0d28gcGF0Y2hlcyBhcmUgZmluZS4gwqBGcm9t
IHRoZSB0ZXN0LCBJJ20gc2VlaW5nIHRoZQpmb2xsb3dpbmcgcmVzdWx0czoKCmV2bV9vdmVybGF5
IDEgVElORk86IG92ZXJ3cml0ZSBmaWxlIGluIG92ZXJsYXkKdHN0X3JvZDogRmFpbGVkIHRvIG9w
ZW4gJyhudWxsKScgZm9yIHdyaXRpbmc6IE9wZXJhdGlvbiBub3QgcGVybWl0dGVkCmV2bV9vdmVy
bGF5IDEgVEZBSUw6IGVjaG8gb3ZlcmxheSA+IG1udHBvaW50L21lcmdlZC9mb28xLnR4dCBmYWls
ZWQgdW5leHBlY3RlZGx5CmV2bV9vdmVybGF5IDIgVElORk86IGFwcGVuZCBmaWxlIGluIG92ZXJs
YXk6IG1udHBvaW50L2xvd2VyL2ZvbzIudHh0CmV2bV9vdmVybGF5IDIgVFBBU1M6IGVjaG8gb3Zl
cmxheSA+PiBtbnRwb2ludC9tZXJnZWQvZm9vMi50eHQgcGFzc2VkIGFzIGV4cGVjdGVkCmV2bV9v
dmVybGF5IDMgVElORk86IGNyZWF0ZSBhIG5ldyBmaWxlIGluIG92ZXJsYXkKZXZtX292ZXJsYXkg
MyBUUEFTUzogZWNobyBvdmVybGF5ID4gbW50cG9pbnQvbWVyZ2VkL2ZvbzMudHh0IHBhc3NlZCBh
cyBleHBlY3RlZApldm1fb3ZlcmxheSA0IFRJTkZPOiByZWFkIGFsbCBjcmVhdGVkIGZpbGVzCmV2
bV9vdmVybGF5IDQgVEZBSUw6IGNhdCBtbnRwb2ludC9tZXJnZWQvZm9vMS50eHQgPiAvZGV2L251
bGwgMj4gL2Rldi9udWxsIGZhaWxlZCB1bmV4cGVjdGVkbHkKZXZtX292ZXJsYXkgNCBURkFJTDog
Y2F0IG1udHBvaW50L21lcmdlZC9mb28yLnR4dCA+IC9kZXYvbnVsbCAyPiAvZGV2L251bGwgZmFp
bGVkIHVuZXhwZWN0ZWRseQpldm1fb3ZlcmxheSA0IFRGQUlMOiBjYXQgbW50cG9pbnQvbWVyZ2Vk
L2ZvbzMudHh0ID4gL2Rldi9udWxsIDI+IC9kZXYvbnVsbCBmYWlsZWQgdW5leHBlY3RlZGx5CmV2
bV9vdmVybGF5IDUgVElORk86IFNFTGludXggZW5hYmxlZCBpbiBlbmZvcmNpbmcgbW9kZSwgdGhp
cyBtYXkgYWZmZWN0IHRlc3QgcmVzdWx0cwpldm1fb3ZlcmxheSA1IFRJTkZPOiBZb3UgY2FuIHRy
eSB0byBkaXNhYmxlIGl0IHdpdGggVFNUX0RJU0FCTEVfU0VMSU5VWD0xIChyZXF1aXJlcyBzdXBl
ci9yb290KQpldm1fb3ZlcmxheSA1IFRJTkZPOiBsb2FkZWQgU0VMaW51eCBwcm9maWxlczogbm9u
ZQoKV2l0aCAiZXZtOiBpbnN0ZWFkIG9mIHVzaW5nIHRoZSBvdmVybGF5ZnMgaV9pbm8sIHVzZSB0
aGUgcmVhbCBpX2lubyIKcGF0Y2gsIEknbSBvbmx5IHNlZWluZyB0aGUgZmlyc3QgZmFpbHVyZS4K
Ck1pbWkKCgo+IFRoZXJlIGlzIGRpZmZlcmVudCByZXByb2R1Y2VyIChDIGNvZGUpIGZvciBhIHNs
aWdodGx5IGRpZmZlcmVudCBzY2VuYXJpbywKPiBidXQgSSdtIG5vdCBnb2luZyB0byBwb3J0IGl0
IGJlZm9yZSB0aGlzIGdvdCBtZXJnZWQuCj4gCj4gSWduYXosIGNvdWxkIHlvdSBwbGVhc2UgdGVz
dCB0aGlzIHBhdGNoc2V0PyBDb3VsZCB5b3UsIHBsZWFzZSwgc2hhcmUgeW91ciBzZXR1cD8KPiBp
bWFfcG9saWN5PWFwcHJhaXNlX3RjYiBrZXJuZWwgcGFyYW1ldGVyIGFuZCBsb2FkaW5nIElNQSBh
bmQgRVZNIGtleXMgb3Zlcgo+IGRyYWN1dC1pbWEgc2NyaXB0cz8gKElNQSBhcHByYWlzYWwgYW5k
IEVWTSB1c2luZyBkaWdpdGFsIHNpZ25hdHVyZXM/IEkgZ3Vlc3MKPiB1c2luZyBoYXNoZXMgZm9y
IElNQSBhcHByYWlzYWwgd291bGQgd29yayBhcyB3ZWxsKS4KPiAKPiBLaW5kIHJlZ2FyZHMsCj4g
UGV0cgo+IAo+ID4gdGhpcyBpcyBhIHNlY29uZCB2ZXJzaW9uIG9mIHBhdGNoIGRlbW9uc3RyYXRp
bmcgYSBidWcgb24gb3ZlcmxheWZzIHdoZW4KPiA+IGNvbWJpbmluZyBJTUEgd2l0aCBFVk0uIFRo
ZXJlIGlzIG9uZ29pbmcgd29yayBtYWRlIGJ5IElnbmF6IEZvcnN0ZXIgYW5kCj4gPiBGYWJpYW4g
Vm9ndCBbMV0gWzJdLCBJTUEgb25seSBiZWhhdmlvciB3YXMgYWxyZWFkeSBmaXhlZCBbM10uCj4g
Cj4gPiBNYWluIHBhdGNoIGlzIHRoZSBsYXN0IG9uZSAocHJldmlvdXMgYXJlIGp1c3QgYSBjbGVh
bnVwIGFuZCBub3QgY2hhbmdlZCkuCj4gCj4gPiBbMV0gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQv
bGlzdHMvbGludXgtaW50ZWdyaXR5L21zZzA1OTI2Lmh0bWwKPiA+IFsyXSBodHRwczovL3d3dy5z
cGluaWNzLm5ldC9saXN0cy9saW51eC1pbnRlZ3JpdHkvbXNnMDM1OTMuaHRtbAo+ID4gWzNdIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA3NzYyMzEvCj4gCj4gWzRdIGh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9sdHAvbGlzdC8/c2VyaWVzPTEwMTIxMyZz
dGF0ZT0qCj4gWzVdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTA3ODU1My8K
PiAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
