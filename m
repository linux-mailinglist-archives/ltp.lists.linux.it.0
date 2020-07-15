Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E0122018C
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 02:58:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CDFC3C4F91
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 02:58:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0725D3C097D
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 02:58:23 +0200 (CEST)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6F87710009EF
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 02:58:22 +0200 (CEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06F0cjxN017275; Tue, 14 Jul 2020 20:58:19 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329d9hj6n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 20:58:19 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06F0u0Z3009189;
 Wed, 15 Jul 2020 00:58:17 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 327527hxuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 00:58:17 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06F0wFUI983404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 00:58:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B04C11C04C;
 Wed, 15 Jul 2020 00:58:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ED7C11C050;
 Wed, 15 Jul 2020 00:58:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.155.184])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jul 2020 00:58:13 +0000 (GMT)
Message-ID: <1594774692.12900.220.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lachlan Sneff <t-josne@linux.microsoft.com>, pvorel@suse.cz,
 ltp@lists.linux.it
Date: Tue, 14 Jul 2020 20:58:12 -0400
In-Reply-To: <20200702153545.3126-2-t-josne@linux.microsoft.com>
References: <20200702153545.3126-1-t-josne@linux.microsoft.com>
 <20200702153545.3126-2-t-josne@linux.microsoft.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-14_09:2020-07-14,
 2020-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=965
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140169
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] IMA: Verify that the kernel cmdline is passed
 and measured correctly through the kexec barrier.
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

T24gVGh1LCAyMDIwLTA3LTAyIGF0IDExOjM1IC0wNDAwLCBMYWNobGFuIFNuZWZmIHdyb3RlOgo+
IEFkZCBhIHRlc3RjYXNlIHRoYXQgdmVyaWZpZXMgdGhhdCBrZXhlYyBjb3JyZWN0bHkgbG9ncyB0
aGUKPiBrZXJuZWwgY29tbWFuZCBsaW5lIHRvIHRoZSBJTUEgYnVmZmVyIGFuZCB0aGF0IHRoZSBj
b21tYW5kCj4gbGluZSBpcyB0aGVuIGNvcnJlY3RseSBtZWFzdXJlZC4KPiAKPiBUaGlzIHRlc3Qg
bXVzdCBiZSBydW4gc3RhbmRhbG9uZSwgc2luY2UgaXQgcnVucyBrZXhlYwo+IG11bHRpcGxlIHRp
bWVzIChhbmQgdGhlcmVmb3JlIHJlYm9vdHMgc2V2ZXJhbCB0aW1lcykuCgpWZXJpZnlpbmcgdGhl
IGtleGVjIGJvb3QgY29tbWFuZCBsaW5lIGRvZXNuJ3QgcmVxdWlyZSByZWJvb3RpbmcuIMKgSnVz
dApsb2FkaW5nIHRoZSBrZXhlYyBrZXJuZWwgaW1hZ2Ugc2hvdWxkIGJlIGVub3VnaCAoa2V4ZWMg
LXMgLWwpLgrCoFZlcmlmeWluZyB0aGF0IHRoZSBtZWFzdXJlbWVudCBsaXN0LCBpbmNsdWRpbmcg
dGhlIGtleGVjIGJvb3QgY29tbWFuZApsaW5lLCBpcyBjYXJyaWVkIGFjcm9zcyBrZXhlYyBjb3Vs
ZCBiZSBhIHNlcGFyYXRlIHRlc3QuCgpNaW1pCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
