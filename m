Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 916A385848
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 04:47:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 420943C1D1B
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 04:47:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 00ABD3C197B
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 04:47:07 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 57ADF100037D
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 04:47:00 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x782hvDB102089;
 Thu, 8 Aug 2019 02:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=lrRmrH7t2DxXhTipWxRRs5ivdb/74vVU7DqRNEZ410k=;
 b=2pId28en9LJEdW0ne3zijEyIyY48YmF3imXfi6P2+oxCWtdJ6n6EKOllE3HNkXrr5Cgp
 25iopFMtfd8J0PeGIJtZLoIgdPA2vGVWrxRnsqRfTfcZglqLzSBICsThdvJrL13fq4/T
 aVshbx3FtGdJ0sIGAQwpJ+wJLDwFPgbaZKp0HBsd7bTk7gyQZ4c2Up4Ap4MqZEB+VrpF
 iTmbzXtzX4OkI2a89ev0Qhj94GjIrsftZtwlv+F7/Qt9fszW46aKfRRnKD5t5l45CN7w
 gt7lhpfWpxRuPcCTPjSVX0u3RXC+7j3W1N3okx3TOm6xL2RQGPktKh5qu4Dlq4kpZkqk ew== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2u51pu7u5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Aug 2019 02:46:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x782hJ4C173010;
 Thu, 8 Aug 2019 02:44:53 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2u7578hr6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Aug 2019 02:44:53 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x782iqqv010401;
 Thu, 8 Aug 2019 02:44:52 GMT
Received: from [192.168.1.222] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 07 Aug 2019 19:44:51 -0700
To: =?UTF-8?B?6KOY56iA55+zKOeogOefsyk=?= <xishi.qiuxishi@alibaba-inc.com>,
 linux-mm <linux-mm@kvack.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, ltp <ltp@lists.linux.it>
References: <f7a64f0a-1ae0-4582-a293-b608bc8fed36.xishi.qiuxishi@alibaba-inc.com>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <5f072c20-2396-48ee-700a-ea7eafc20328@oracle.com>
Date: Wed, 7 Aug 2019 19:44:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f7a64f0a-1ae0-4582-a293-b608bc8fed36.xishi.qiuxishi@alibaba-inc.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908080027
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908080027
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugetlbfs: fix hugetlb page migration/fault race
 causing SIGBUS
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
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gOC83LzE5IDc6MjQgUE0sIOijmOeogOefsyjnqIDnn7MpIHdyb3RlOgo+IEhpIE1pa2UsCj4g
Cj4gRG8geW91IG1lYW4gdGhlIHNpbWlsYXIgcmFjZSBpcyBsaWtlIHRoZSBmb2xsb3dpbmc/Cj4g
Cj4gbWlncmF0aW9uIGNsZWFyaW5nIHRoZSBwdGUKPiAgIHBhZ2UgZmF1bHQoYmVmb3JlIHdlIHJl
dHVybiBlcnJvciwgYW5kIG5vdyB3ZSByZXR1cm4gMCwgdGhlbiB0cnkgcGFnZSBmYXVsdCBhZ2Fp
biwgcmlnaHQ/KQo+ICAgICBtaWdyYXRpb24gd3JpdGluZyBhIG1pZ3JhdGlvbiBlbnRyeQoKWWVz
LCBzb21ldGhpbmcgbGlrZSB0aGUgdGhhdC4gIFRoZSBjaGFuZ2UgaXMgdG8gdGFrZXMgdGhlIHBh
Z2UgdGFibGUgbG9jawp0byBleGFtaW5lIHRoZSBwdGUgYmVmb3JlIHJldHVybmluZy4gIElmIHRo
ZSBwdGUgaXMgY2xlYXIgd2hlbiBleGFtaW5lZAp3aGlsZSBob2xkaW5nIHRoZSBsb2NrLCBhbiBl
cnJvciB3aWxsIGJlIHJldHVybmVkIGFzIGJlZm9yZS4gIElmIG5vdCBjbGVhciwKdGhlbiB3ZSBy
ZXR1cm4gemVybyBhbmQgdHJ5IGFnYWluLgoKVGhpcyBjaGFuZ2UgYWRkcyBjb2RlIHdoaWNoIGlz
IHZlcnkgbXVjaCBsaWtlIHRoaXMgY2hlY2sgZnVydGhlciBpbgp0aGUgcm91dGluZSBodWdldGxi
X25vX3BhZ2UoKToKCglwdGwgPSBodWdlX3B0ZV9sb2NrKGgsIG1tLCBwdGVwKTsKCXNpemUgPSBp
X3NpemVfcmVhZChtYXBwaW5nLT5ob3N0KSA+PiBodWdlX3BhZ2Vfc2hpZnQoaCk7CglpZiAoaWR4
ID49IHNpemUpCgkJZ290byBiYWNrb3V0OwoKCXJldCA9IDA7CglpZiAoIWh1Z2VfcHRlX25vbmUo
aHVnZV9wdGVwX2dldChwdGVwKSkpCgkJZ290byBiYWNrb3V0OwoKLS0gCk1pa2UgS3JhdmV0egoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
