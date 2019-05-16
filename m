Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 133CF21075
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 00:11:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7FCE3EA496
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 00:11:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 52CF93EA449
 for <ltp@lists.linux.it>; Fri, 17 May 2019 00:11:11 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BCEE660066A
 for <ltp@lists.linux.it>; Fri, 17 May 2019 00:11:12 +0200 (CEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4GLux2k069659
 for <ltp@lists.linux.it>; Thu, 16 May 2019 18:11:07 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2shfp29guf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Thu, 16 May 2019 18:11:07 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ltp@lists.linux.it> from <zohar@linux.ibm.com>;
 Thu, 16 May 2019 23:11:05 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 May 2019 23:11:02 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4GMB1Pg31064128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 22:11:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D71DA4053;
 Thu, 16 May 2019 22:11:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 565DDA405B;
 Thu, 16 May 2019 22:11:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.80.98])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 May 2019 22:11:00 +0000 (GMT)
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 16 May 2019 18:10:49 -0400
In-Reply-To: <20190515120853.GA22992@dell5510>
References: <20190405165225.27216-1-pvorel@suse.cz>
 <20190514121213.GA28655@dell5510> <1557889279.4581.14.camel@linux.ibm.com>
 <20190515120853.GA22992@dell5510>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19051622-0008-0000-0000-000002E77CF2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051622-0009-0000-0000-00002254245D
Message-Id: <1558044649.4507.10.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=941 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905160133
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: Ignaz Forster <iforster@suse.de>, linux-integrity@vger.kernel.org,
 Marcus Meissner <meissner@suse.com>, ltp@lists.linux.it,
 Fabian Vogt <FVogt@suse.com>
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

SGkgUGV0ciwKCk9uIFdlZCwgMjAxOS0wNS0xNSBhdCAxNDowOCArMDIwMCwgUGV0ciBWb3JlbCB3
cm90ZToKPiA+IGV2bV9vdmVybGF5IDEgVElORk86IG92ZXJ3cml0ZSBmaWxlIGluIG92ZXJsYXkK
PiA+IHRzdF9yb2Q6IEZhaWxlZCB0byBvcGVuICcobnVsbCknIGZvciB3cml0aW5nOiBPcGVyYXRp
b24gbm90IHBlcm1pdHRlZAo+ID4gZXZtX292ZXJsYXkgMSBURkFJTDogZWNobyBvdmVybGF5ID4g
bW50cG9pbnQvbWVyZ2VkL2ZvbzEudHh0IGZhaWxlZCB1bmV4cGVjdGVkbHkKCj4gSSd2ZSBmaXhl
ZCAnKG51bGwpJyBbMV0sIHdpdGggdGhhdCBvbmUgYXBwbGllZCBpdCBzaG91bGQgYmUgJ21udHBv
aW50L21lcmdlZC9mb28xLnR4dCcKClRoYW5rcyEKCj4gQnV0IHdoYXQgaXMgc3RyYW5nZSB0byBt
ZSBpcyB0aGF0IGl0IGNvbnRpbnVlcyB0byBleGVjdXRlIHNlY29uZCBsaW5lLiByZXR1cm4gMSBb
Ml0KPiBzaG91bGQgY2F1c2UgUk9EKCkgdG8gcXVpdCB3aXRoIFRCUk9LIFszXS4KPiBNYXliZSB0
aGF0IFJPRCBpbiB0ZXN0MSgpIHNob3VsZCBiZSByZXBsYWNlZCBFWFBFQ1RfUEFTUy4KCldpdGgg
anVzdCB0aGUgZmlyc3QgcGF0Y2ggb2YgSWduYXoncyBwYXRoIHNldCBbMV0gYW5kIHRoZSBUUE0g
Mi4wIHRlc3QKWzJdLCB0aGVyZSBhcmVuJ3QgYW55IGVycm9ycy4gwqBXaXRob3V0IFsxXSwgaXQn
cyBub3cgZmFpbGluZyB3aXRoIHRoZQpjb3JyZWN0IG5hbWUuIMKgSSdtIG5vdyBzZWVpbmc6Cgpl
dm1fb3ZlcmxheSAxIFRJTkZPOiAkVE1QRElSIGlzIG9uIHRtcGZzID0+IHJ1biBvbiBsb29wIGRl
dmljZQpldm1fb3ZlcmxheSAxIFRJTkZPOiBGb3JtYXR0aW5nIC9kZXYvbG9vcDAgd2l0aCBleHQz
IGV4dHJhIG9wdHM9JycKZXZtX292ZXJsYXkgMSBUSU5GTzogb3ZlcndyaXRlIGZpbGUgaW4gb3Zl
cmxheQp0c3Rfcm9kOiBGYWlsZWQgdG8gb3BlbiAnbW50cG9pbnQvbWVyZ2VkL2ZvbzEudHh0JyBm
b3Igd3JpdGluZzogUGVybWlzc2lvbiBkZW5pZWQKZXZtX292ZXJsYXkgMSBURkFJTDogZWNobyBv
dmVybGF5ID4gbW50cG9pbnQvbWVyZ2VkL2ZvbzEudHh0IGZhaWxlZCB1bmV4cGVjdGVkbHkKCk1p
bWkKClsxXSBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1pbnRlZ3JpdHkvbXNn
MDU5MjYuaHRtbApbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW50ZWdyaXR5LzE1
NTgwNDExNjIuMzk3MS4yLmNhbWVsQGxpbnV4LmlibS5jb20vVC8jdQoKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
