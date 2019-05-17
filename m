Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295721793
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 13:19:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0CA4D3EA62E
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 13:19:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3B21A3EA58E
 for <ltp@lists.linux.it>; Fri, 17 May 2019 13:19:57 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 503D71A01785
 for <ltp@lists.linux.it>; Fri, 17 May 2019 13:19:55 +0200 (CEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HBDDHY047381
 for <ltp@lists.linux.it>; Fri, 17 May 2019 07:19:54 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2shu7t23uw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 17 May 2019 07:19:53 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ltp@lists.linux.it> from <zohar@linux.ibm.com>;
 Fri, 17 May 2019 12:19:50 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 May 2019 12:19:47 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4HBJkTK52428856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 May 2019 11:19:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33A4AA405F;
 Fri, 17 May 2019 11:19:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61975A4054;
 Fri, 17 May 2019 11:19:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.80.67])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 May 2019 11:19:45 +0000 (GMT)
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri, 17 May 2019 07:19:34 -0400
In-Reply-To: <20190517065116.GA8170@dell5510>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <20190517065116.GA8170@dell5510>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19051711-0016-0000-0000-0000027CBA58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051711-0017-0000-0000-000032D9969D
Message-Id: <1558091974.4507.60.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170075
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Peter =?ISO-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] ima: skip verifying TPM 2.0 PCR values
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

T24gRnJpLCAyMDE5LTA1LTE3IGF0IDA4OjUxICswMjAwLCBQZXRyIFZvcmVsIHdyb3RlOgoKPiA+
IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVz
dHMvaW1hX3RwbS5zaCBiL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90
ZXN0cy9pbWFfdHBtLnNoCj4gPiBpbmRleCAwZmZjM2MwMjI0N2QuLmViZTRiNGMzNjBlNCAxMDA3
NTUKPiA+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0
cy9pbWFfdHBtLnNoCj4gPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0
eS9pbWEvdGVzdHMvaW1hX3RwbS5zaAo+ID4gQEAgLTg4LDYgKzg4LDE0IEBAIHRlc3QyKCkKPiA+
ICAJdHN0X3JlcyBUSU5GTyAidmVyaWZ5IFBDUiB2YWx1ZXMiCj4gPiAgCXRzdF9jaGVja19jbWRz
IGV2bWN0bAo+IAo+ID4gKwlsb2NhbCB0cG1fZGVzY3JpcHRpb249Ii9zeXMvY2xhc3MvdHBtL3Rw
bTAvZGV2aWNlL2Rlc2NyaXB0aW9uIgo+ID4gKwlpZiBbIC1mICIkdHBtX2Rlc2NyaXB0aW9uIiBd
OyB0aGVuCj4gPiArCQlpZiBncmVwIC1xICJeXFRQTSAyLjAiICR0cG1fZGVzY3JpcHRpb247IHRo
ZW4KCj4gSSBndWVzcyB0aGUgYmFja3NsYXNoIGluICJeXFRQTSAyLjAiIGlzIGEgdHlwby4KPiBJ
ZiB5ZXMsIG5vIG5lZWQgdG8gcmVwb3N0LCBJJ2xsIGZpeCBpdCB3aGVuIGFwcGx5aW5nIHlvdXIg
cGF0Y2guCj4gKyBJJ2QgcHJlZmVyIGpvaW4gMiBpZnMgaW50byBzaW5nbGUgb25lLCBidXQgdGhh
dCdzIGp1c3QgbWF0dGVyIG9mIHByZWZlcmVuY2UsCj4gbm90IGltcG9ydGFudC4KClRoYW5rIHlv
dSBmb3IgZml4aW5nIGl0LiDCoEknZCBqdXN0IGxpa2UgdG8gaGVhciBmcm9tIG90aGVycyBmaXJz
dCwgaWYKdGhpcyBpcyBjb3JyZWN0IHdheSB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gVFBNIDEu
MiBhbmQgVFBNIDIuMC4KCk1pbWkKCgo+ID4gKwkJCXRzdF9yZXMgVENPTkYgIlRQTSAyLjAgZW5h
YmxlZCwgYnV0IG5vdCBzdXBwb3J0ZWQiCj4gPiArCQkJcmV0dXJuIDAKPiA+ICsJCWZpCj4gPiAr
CWZpCj4gPiArCj4gPiAgCXRzdF9yZXMgVElORk8gImV2bWN0bCB2ZXJzaW9uOiAkKGV2bWN0bCAt
LXZlcnNpb24pIgo+IAo+ID4gIAlsb2NhbCBwY3JzX3BhdGg9Ii9zeXMvY2xhc3MvdHBtL3RwbTAv
ZGV2aWNlL3BjcnMiCj4gCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
