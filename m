Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0091229EFA
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 20:10:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 338783C7F42
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 20:10:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 088493C1D5C
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 20:09:58 +0200 (CEST)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 537521000956
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 20:09:58 +0200 (CEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06MI3BvU158881; Wed, 22 Jul 2020 14:09:55 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vs4u1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 14:09:55 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06MI7Dms030353;
 Wed, 22 Jul 2020 18:09:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 32brbgtqn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 18:09:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06MI9pEW62259306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 18:09:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F089BAE057;
 Wed, 22 Jul 2020 18:09:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EE4EAE053;
 Wed, 22 Jul 2020 18:09:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.219.44])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jul 2020 18:09:49 +0000 (GMT)
Message-ID: <1595441389.5211.1.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lachlan Sneff <t-josne@linux.microsoft.com>, pvorel@suse.cz,
 ltp@lists.linux.it
Date: Wed, 22 Jul 2020 14:09:49 -0400
In-Reply-To: <20200722164040.23109-1-t-josne@linux.microsoft.com>
References: <20200722164040.23109-1-t-josne@linux.microsoft.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_10:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220114
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] IMA: Add test for kexec cmdline measurement
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gV2VkLCAyMDIwLTA3LTIyIGF0IDEyOjQwIC0wNDAwLCBMYWNobGFuIFNuZWZmIHdyb3RlOgo+
IElNQSBwb2xpY3kgY2FuIGJlIHNldCB0byBtZWFzdXJlIHRoZSBjb21tYW5kIGxpbmUgcGFzc2Vk
IGluIHRoZSBrZXhlYyBzeXN0ZW0gY2FsbC4KPiBUaGVyZSBuZWVkcyB0byBiZSBhIHRlc3QgdG8g
dmFsaWRhdGUgdGhpcyBrZXhlYyBjb21tYW5kIGxpbmUgbWVhc3VyZW1lbnQuCj4gCj4gQWRkIGEg
dGVzdGNhc2UgdGhhdCB2ZXJpZmllcyB0aGF0IHRoZSBJTUEgc3Vic3lzdGVtIGhhcyBjb3JyZWN0
bHkKPiBtZWFzdXJlZCB0aGUgY21kbGluZSBzcGVjaWZpZWQgZHVyaW5nIGEga2V4ZWMuCj4gCj4g
Tm90ZSB0aGF0IHRoaXMgdGVzdCBkb2VzIG5vdCBhY3R1YWxseSByZWJvb3QuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTGFjaGxhbiBTbmVmZiA8dC1qb3NuZUBsaW51eC5taWNyb3NvZnQuY29tPgoKT3Ro
ZXIgdGhhbiB0aGUgcGF0Y2ggbm90IGFwcGx5aW5nIGNsZWFubHkgYW5kIGxlYWRpbmcgYmxhbmtz
LMKgCgpSZXZpZXdlZC1ieTogTWltaSBab2hhciA8em9oYXJAbGludXguaWJtLmNvbT4KCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
