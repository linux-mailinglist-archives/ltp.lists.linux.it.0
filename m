Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1F71FC1C6
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 00:40:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6074D3C5FBD
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 00:40:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 345973C02EF
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 00:40:21 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4FDDD600A48
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 00:39:32 +0200 (CEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GMX8hp025786; Tue, 16 Jun 2020 18:40:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31q6j4grn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 18:40:17 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05GMb6sB040484;
 Tue, 16 Jun 2020 18:40:16 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31q6j4grmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 18:40:16 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05GMeF2k032083;
 Tue, 16 Jun 2020 22:40:15 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 31q6bs81kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 22:40:14 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05GMeCeI983414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 22:40:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C60CA52097;
 Tue, 16 Jun 2020 22:40:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.158.198])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 94F5E52096;
 Tue, 16 Jun 2020 22:40:11 +0000 (GMT)
Message-ID: <1592347211.11061.250.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Bruno Meneguele <bmeneg@redhat.com>, Petr Vorel <pvorel@suse.cz>
Date: Tue, 16 Jun 2020 18:40:11 -0400
In-Reply-To: <20200615200121.GG129694@glitch>
References: <20200527071434.28574-1-pvorel@suse.cz>
 <1590601280.16219.1.camel@linux.ibm.com> <20200528140747.GA8401@dell5510>
 <1590679145.4457.39.camel@linux.ibm.com> <20200528160527.GA27243@dell5510>
 <20200615194134.GF129694@glitch> <20200615200121.GG129694@glitch>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_13:2020-06-16,
 2020-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 cotscore=-2147483648 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006160154
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [LTP v2 1/1] ima_tpm.sh: Fix for calculating boot
 aggregate
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
Cc: Vitaly Chikunov <vt@altlinux.org>, linux-integrity@vger.kernel.org,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gTW9uLCAyMDIwLTA2LTE1IGF0IDE3OjAxIC0wMzAwLCBCcnVubyBNZW5lZ3VlbGUgd3JvdGU6
Cj4gT24gTW9uLCBKdW4gMTUsIDIwMjAgYXQgMDQ6NDE6MzRQTSAtMDMwMCwgQnJ1bm8gTWVuZWd1
ZWxlIHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgMjgsIDIwMjAgYXQgMDY6MDU6MjdQTSArMDIwMCwg
UGV0ciBWb3JlbCB3cm90ZToKCj4gPiA+ID4gVGhlIGJvb3RfYWdncmVnYXRlLnRycyBhbmQgYm9v
dF9hZ2dyZWdhdGUubG9nIGZpbGVzIGFyZSBiZWluZyBjcmVhdGVkCj4gPiA+ID4gaW4gdGhlIHRl
c3RzLyBkaXJlY3RvcnkuIMKgSXMgdGhhdCBkaXJlY3RvcnkgcmVhZC1vbmx5Pwo+ID4gPiBZZXMs
IGRyd3hyLXhyLXguIFRlc3Rpbmcgb24gZnJlc2ggY2xvbmUgYW5kIGlzc3VlIHBlcnNpc3RzLgo+
ID4gPiAKPiA+IAo+ID4gWWVzLCBzYW1lIHRoaW5nIGhlcmUuLiBidXQgZGlkbid0IHJlYWxseSBj
aGVjayB0aGUgcmVhc29uIGZvciB0aGF0LiBXaWxsCj4gPiB0YWtlIGEgdGltZSBsYXRlciB0byBz
ZWUgd2hhdCdzIGhhcHBlbmluZy4KCkNsb25pbmcgYXMgcm9vdCB3aWxsIGNhdXNlIHRoYXQgdG8g
aGFwcGVuLgoKJCBzdWRvIGdpdCBjbG9uZSBnaXQ6Ly9naXQuY29kZS5zZi5uZXQvcC9saW51eC1p
bWEvaW1hLWV2bS11dGlscyAtLWJyYW5jaCBuZXh0LXRlc3RpbmcKQ2xvbmluZyBpbnRvICdpbWEt
ZXZtLXV0aWxzJy4uLgpyZW1vdGU6IEVudW1lcmF0aW5nIG9iamVjdHM6IDExNTQsIGRvbmUuCnJl
bW90ZTogQ291bnRpbmcgb2JqZWN0czogMTAwJSAoMTE1NC8xMTU0KSwgZG9uZS4KcmVtb3RlOiBD
b21wcmVzc2luZyBvYmplY3RzOiAxMDAlICgxMDUyLzEwNTIpLCBkb25lLgpyZW1vdGU6IFRvdGFs
IDExNTQgKGRlbHRhIDczNiksIHJldXNlZCAxODIgKGRlbHRhIDk2KQpSZWNlaXZpbmcgb2JqZWN0
czogMTAwJSAoMTE1NC8xMTU0KSwgMzM1LjEyIEtpQiB8IDAgYnl0ZXMvcywgZG9uZS4KUmVzb2x2
aW5nIGRlbHRhczogMTAwJSAoNzM2LzczNiksIGRvbmUuCkNoZWNraW5nIGNvbm5lY3Rpdml0eS4u
LiBkb25lLgoKJCBscyAtbGF0IGltYS1ldm0tdXRpbHMvIHwgZ3JlcCB0ZXN0cwpkcnd4ci14ci14
LiAgMiByb290IHJvb3QgICAyMjAgSnVuIDE2IDE4OjI4IHRlc3RzCgpNaW1pCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
