Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A0320FE3
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 23:13:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A8923EA441
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 23:13:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 440183EA399
 for <ltp@lists.linux.it>; Thu, 16 May 2019 23:13:01 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3274A1002768
 for <ltp@lists.linux.it>; Thu, 16 May 2019 23:12:56 +0200 (CEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4GKvN2N048975
 for <ltp@lists.linux.it>; Thu, 16 May 2019 17:12:58 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2shcrg6fg4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Thu, 16 May 2019 17:12:57 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ltp@lists.linux.it> from <zohar@linux.ibm.com>;
 Thu, 16 May 2019 22:12:56 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 May 2019 22:12:54 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4GLCrri39321776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 21:12:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E1A211C050;
 Thu, 16 May 2019 21:12:53 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2B6D11C052;
 Thu, 16 May 2019 21:12:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.95.241])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 May 2019 21:12:52 +0000 (GMT)
From: Mimi Zohar <zohar@linux.ibm.com>
To: linux-integrity <linux-integrity@vger.kernel.org>
Date: Thu, 16 May 2019 17:12:42 -0400
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19051621-4275-0000-0000-00000335964D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051621-4276-0000-0000-000038451F7A
Message-Id: <1558041162.3971.2.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905160129
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH] ima: skip verifying TPM 2.0 PCR values
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

VFBNIDEuMiBleHBvcnRlZCB0aGUgUENScy4gIFJlYWRpbmcgdGhlIFRQTSAyLjAgUENScyByZXF1
aXJlcyBhCnVzZXJzcGFjZSBhcHBsaWNhdGlvbi4gIEZvciBub3csIHNraXAgdGhpcyB0ZXN0LgoK
U2lnbmVkLW9mZi1ieTogTWltaSBab2hhciA8em9oYXJAbGludXguaWJtLmNvbT4KLS0tCiB0ZXN0
Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX3RwbS5zaCB8IDgg
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX3RwbS5zaCBi
L3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFfdHBtLnNo
CmluZGV4IDBmZmMzYzAyMjQ3ZC4uZWJlNGI0YzM2MGU0IDEwMDc1NQotLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX3RwbS5zaAorKysgYi90ZXN0
Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX3RwbS5zaApAQCAt
ODgsNiArODgsMTQgQEAgdGVzdDIoKQogCXRzdF9yZXMgVElORk8gInZlcmlmeSBQQ1IgdmFsdWVz
IgogCXRzdF9jaGVja19jbWRzIGV2bWN0bAogCisJbG9jYWwgdHBtX2Rlc2NyaXB0aW9uPSIvc3lz
L2NsYXNzL3RwbS90cG0wL2RldmljZS9kZXNjcmlwdGlvbiIKKwlpZiBbIC1mICIkdHBtX2Rlc2Ny
aXB0aW9uIiBdOyB0aGVuCisJCWlmIGdyZXAgLXEgIl5cVFBNIDIuMCIgJHRwbV9kZXNjcmlwdGlv
bjsgdGhlbgorCQkJdHN0X3JlcyBUQ09ORiAiVFBNIDIuMCBlbmFibGVkLCBidXQgbm90IHN1cHBv
cnRlZCIKKwkJCXJldHVybiAwCisJCWZpCisJZmkKKwogCXRzdF9yZXMgVElORk8gImV2bWN0bCB2
ZXJzaW9uOiAkKGV2bWN0bCAtLXZlcnNpb24pIgogCiAJbG9jYWwgcGNyc19wYXRoPSIvc3lzL2Ns
YXNzL3RwbS90cG0wL2RldmljZS9wY3JzIgotLSAKMi43LjUKCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
