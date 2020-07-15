Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FA92201F2
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 03:42:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 695893C4F8F
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 03:42:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 573793C2491
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 03:41:58 +0200 (CEST)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A477C601AC1
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 03:41:57 +0200 (CEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06F1fQQS139902; Tue, 14 Jul 2020 21:41:54 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 327u1j4b6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 21:41:54 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06F1ZifU009636;
 Wed, 15 Jul 2020 01:41:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 329nmyg3s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 01:41:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06F1foHU29360444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 01:41:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4313CAE045;
 Wed, 15 Jul 2020 01:41:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80736AE04D;
 Wed, 15 Jul 2020 01:41:49 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.155.184])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jul 2020 01:41:49 +0000 (GMT)
Message-ID: <1594777309.12900.237.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lachlan Sneff <t-josne@linux.microsoft.com>, pvorel@suse.cz,
 ltp@lists.linux.it
Date: Tue, 14 Jul 2020 21:41:49 -0400
In-Reply-To: <20200702153545.3126-3-t-josne@linux.microsoft.com>
References: <20200702153545.3126-1-t-josne@linux.microsoft.com>
 <20200702153545.3126-3-t-josne@linux.microsoft.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-14_10:2020-07-14,
 2020-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150011
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] IMA: Verify IMA buffer passing through the
 kexec barrier
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
IEFkZCBhIHRlc3RjYXNlIHRoYXQgdmVyaWZpZXMgdGhhdCBrZXhlYyBjb3JyZWN0bHkgcGFzc2Vz
Cj4gdGhlIElNQSBidWZmZXIgdGhyb3VnaCB0aGUgc29mdCByZWJvb3QuCj4gCj4gVGhpcyB0ZXN0
IG11c3QgYmUgcnVuIHN0YW5kYWxvbmUsIHNpbmNlIGl0IHJ1bnMga2V4ZWMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTGFjaGxhbiBTbmVmZiA8dC1qb3NuZUBsaW51eC5taWNyb3NvZnQuY29tPgoKRGVw
ZW5kaW5nIG9uIHRoZSBwb2xpY3ksIHRoZSBtZWFzdXJlbWVudCBsaXN0IGNvdWxkIGJlIGV4YWN0
bHkgdGhlCnNhbWUgZnJvbSBvbmUgYm9vdCB0byB0aGUgbmV4dC4gwqBUaGlzIHRlc3Qgc2ltcGx5
IGNoZWNrcyB0aGF0IHRoZQpmaXJzdCBOIG51bWJlciBvZiBtZWFzdXJlbWVudHMgYXJlIHRoZSBz
YW1lLiDCoEl0IGRvZXNuJ3QgdmVyaWZ5IHRoYXQKdGhlcmUgYXJlIGFkZGl0aW9uYWwgbWVhc3Vy
ZW1lbnRzLCBub3IgZG9lcyBpdCBjaGVjayB0aGF0IHRoZXJlIGlzIGFuCmFkZGl0aW9uYWwgImJv
b3RfYWdncmVnYXRlIiBhZnRlciB0aGUga2V4ZWMuIMKgQXQgbWluaW11bSB0aGUgdGVzdApzaG91
bGQgdmVyaWZ5IHRoZSBleGlzdGVuY2Ugb2YgbXVsdGlwbGUgImJvb3RfYWdncmVnYXRlIiB2YWx1
ZXMgaW4gdGhlCm1lYXN1cmVtZW50IGxpc3QuCgpBIG1vcmUgY29tcGxldGUgdGVzdCB3b3VsZCB3
YWxrIHRoZSBtZWFzdXJlbWVudCBsaXN0LCByZS1jYWxjdWxhdGluZwp0aGUgUENSIGRpZ2VzdHMs
IGFuZCB0aGVuIGNvbXBhcmUgdGhlIHJlY2FsY3VsYXRlZCBQQ1JTIGFnYWluc3QgdGhlClRQTSBQ
Q1JzLiDCoElmIGFsbCB0aGUgbWVhc3VyZW1lbnRzIHdlcmUgcHJvcGVybHkgY2FycmllZCBhY3Jv
c3MgdGhlCmtleGVjLCB0aGUgUENSIGRpZ2VzdHMgc2hvdWxkIG1hdGNoLgoKTWltaQoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
