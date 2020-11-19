Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC3D2B91E6
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 12:57:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A2093C5F6D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 12:57:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 63BC73C2F45
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 12:57:49 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9C6FB1000B57
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 12:57:48 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AJBrhQR162601;
 Thu, 19 Nov 2020 11:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=oiUg1xzvptqczd1FkADpNZmPD4kjWf1Bw6kMz765mAo=;
 b=erm9ZPvGpzngtW09wcoh77mJYcMzEopP3b68sOEXqAetccuhA11hzsPWhmWZ6i5QGPW0
 7Zw8RzzbZNqWR1ZfiCW4q4e7EQsXd+sIWWXpW7SlaJb16ex9EddMhXDxBFQLl/U3GzmQ
 p4M5Mxp5u5OpN78Z9ajB4Q/JjsE6+E3O8BH4aEQJiN8IXvYw4uhHB4EA3814e6D5aU5V
 e3yI1D8oWwPjnpFYooQXTvxpF1/yEvrbVLMrOYYysLZUVo8k0D5FYHO6gjXjj7Bvkh4R
 sU/y+UKAfW/NXkCXQMnR3eKFbJrvmtE2e9GvKHL2v6jcIHma/4pldFwZmmXEQSNe6BFC +Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34t7vncy4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Nov 2020 11:57:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AJBtO3P155315;
 Thu, 19 Nov 2020 11:57:32 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 34umd1v9up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 11:57:32 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AJBvS32015876;
 Thu, 19 Nov 2020 11:57:29 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Nov 2020 03:57:28 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Joerg Vehlow <lkml@jv-coder.de>, ltp@lists.linux.it
References: <20201117124320.783802-1-lkml@jv-coder.de>
 <057bc703-d3b6-5d8a-4831-609e332fdc36@oracle.com>
 <98732a50-84e4-97b2-5124-757d91eba7a4@jv-coder.de>
Message-ID: <5f17f668-87c3-cd89-fdd9-7d6835b8ba65@oracle.com>
Date: Thu, 19 Nov 2020 14:57:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <98732a50-84e4-97b2-5124-757d91eba7a4@jv-coder.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9809
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011190090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9809
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=2
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011190090
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] network/stress/multicast/packet-flood:
 Update to new API
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMTkuMTEuMjAyMCAxMDo0OSwgSm9lcmcgVmVobG93IHdyb3RlOgo+IEhpIEFsZXhleSwKPj4g
VGhlIGZvbGxvd2luZyBjb21tYW5kIHNob3VsZCBzdXBwb3J0IGJvdGggdWRwL3VkcDY6Cj4+CgpI
aSBKb2VyZywKCj4+IGxvY2FsIG1jYXN0X3BvcnQ9JCh0c3RfZ2V0X3VudXNlZF9wb3J0IGlwdiR7
VFNUX0lQVkVSfSBkZ3JhbSkKPiBBY3R1YWxseSBmaW5kX3BvcnRidW5kbGUgZG9lc24ndCBkaXN0
aW5ndWlzaCBiZXR3ZWVuIGlwdjYgYW5kIGlwdjQgd2hlbiAKPiBsb29raW5nIGZvciBhIHdpbmRv
dyBvZiBmcmVlIHBvcnRzLCBzbyBpdCB3b3JrcyBmb3IgYm90aCB2YXJpYW50cy4gVGhlIAoKSSBz
ZWUsIGZpbmRfcG9ydGJ1bmRsZSBpcyBqdXN0IGEgd3JhcHBlciBmb3IgbmV0c3RhdCBhbmQgaXQn
cyBub3Qgc2V0dGluZwphbnkgYWRkcmVzcyBmYW1pbHksIHNvIG5ldHN0YXQgbGlzdCBhbGwuCgo+
IG9ubHkgdGhpbmcgdGhhdCBjYW4gaGFwcGVuLCBpcyB0aGF0IGl0IGZpbmRzIG5vIGZyZWUgcG9y
dHMgYXQgYWxsLCBldmVuIAo+IGlmIHRoZXJlIGFyZSBzb21lIGZyZWUgcG9ydHMsIGJ1dCB0aGF0
IGlzIHByb2JhYmx5IGhpZ2hseSB1bmxpa2VseS4KPiBTdGlsbCBJIHdvdWxkIHNheTogTGV0J3Mg
Z2V0IHJpZCBvZiB0aGlzIGZ1bmN0aW9uIGFuZCByZW1vdmUgdXNhZ2UgYXMgd2UgCj4gZ286IEkg
d2lsbCBjaGFuZ2UgaXQgYW55d2F5LCBiZWNhdXNlIEkgZG9uJ3QgbGlrZSB0aGlzLgo+PiBUaGlz
IGNoZWNrIGNhbiBiZSByZXBsYWNlZCB3aXRoCj4+Cj4+IFJPRCBucy1tY2FzdF9yZWNlaXZlciAt
ZiAkVFNUX0lQVkVSIC1JICQodHN0X2lmYWNlIGxob3N0KSAtbSAkbWNhc3RfYWRkciAtcCAkbWNh
c3RfcG9ydCAtYgo+IEFDSwo+PiBXaGF0IGlmIHdlIHN3YXAgc2VuZGVyIGFuZCByZWNlaXZlciwg
aS5lLgo+Pgo+PiBsb2NhbCBuc19vcHRzPSItZiAkVFNUX0lQVkVSIC1wICRtY2FzdF9wb3J0Igo+
Pgo+PiB0c3Rfcmhvc3RfcnVuIC1zIC1jICJucy1tY2FzdF9yZWNlaXZlciAkbnNfb3B0cyAtSSAk
KHRzdF9pZmFjZSByaG9zdCkgLW0gJG1jYXN0X2FkZHIgLWIiCj4+IEVYUEVDVF9QQVNTIG5zLXVk
cHNlbmRlciAtRCAkbWNhc3RfYWRkciAkbnNfb3B0cyAtcyAzMjc2NyAtbSAtSSAkKHRzdF9pZmFj
ZSkgLXQgJE5TX0RVUkFUSU9OCj4+Cj4+IEJ5IGRlZmF1bHQsIGx0cCBpcyB1c2luZyBuZXR3b3Jr
IG5hbWVzcGFjZSwgc28gaXQncyBwcm9iYWJseSBiZXR0ZXIKPj4gdG8gcnVuIHRoZSBiYWNrZ3Jv
dW5kIHNlcnZpY2UgdGhlcmUuCj4gSSB0aGluayB0aGUgInRoaW5nLXVuZGVyLXRlc3QiIGhlcmUg
aXMgdGhlIHJlY2VpdmVyLCBub3QgdGhlIHNlbmRlci4gSSAKPiBkb24ndCBzZWUgYW55IGJlbmVm
aXQgc3dhcHBpbmcgdGhpcywgaXQgd2lsbCBvbmx5IG1vdmUgdGhlIHRlc3QgdG8gdGhlIAo+IHdy
b25nIG1hY2hpbmUsIGlmIG5ldHdvcmsgbmFtZXNwYWNlcyBhcmUgbm90IGluIHVzCj4+CgpCb3Ro
IG1hY2hpbmVzIGFyZSB1bmRlciB0ZXN0LgoKPj4+ICsJZG9uZQo+Pj4gKwo+Pj4gKwlzbGVlcCAk
TlNfRFVSQVRJT04KPj4KPj4gSXQgd291bGQgYmUgbmljZSB0byBoYXZlIGEgc21hbGwgbG9vcCBp
bnN0ZWFkIG9mIGEgc2luZ2xlICdzbGVlcCcgYW5kCj4+IHBlcmlvZGljYWxseSBjaGVjayB0aGF0
IHRoZSBiYWNrZ3JvdW5kIHNlbmRlcnMgYXJlIHJlYWxseSBydW5uaW5nLi4uCj4gSSBhbHNvIGRv
bid0IG5vcm1hbGx5IGxpa2Ugc2xlZXBzLCBidXTCoCBhY3R1YWxseSB0aGUgd2F5IHRoZSB0ZXN0
IGlzIAo+IGltcGxlbWVudGVkIGF0IHRoZSBtb21lbnQgaXQgd291bGQgbWFrZSBsaXR0bGUgc2Vu
c2UgdG8gYWRkIGFsbCB0aGUgCj4gY29tcGxleGl0eSByZXF1aXJlZCwgdG8gY29sbGVjdCBwaWRz
LCB0byBjaGVjayB0aGUgc2VuZGVycyBhbmQgaW1wbGVtZW50IAo+IGEgdGltZW91dCBSaWdodCBh
ZnRlciB0aGUgbGFzdCBucy11ZHBzZW5kZXIgaXMgc3RhcnRlZCwgdGhhdCBydW5zIGZvciAKPiBO
U19EVVJBVElPTiwgdGhlIHNsZWVwIGlzIGV4ZWN1dGVkIGZvciBOU19EVVJBVElPTi4gRXZlbiBp
ZiB0aGUgc2xlZXAgCj4gZXhpdHMgYmVmb3JlIG5zLXVkcHNlbmRlciwgaXQgZG9lc24ndCBtYXR0
ZXIsIGJlY2F1c2UgaXQgaXMganVzdCBhIGJpdCAKPiBlYXJsaWVyIGFuZCB0aGUgdGVzdCB0aW1l
IGlzIGFjdHVhbGx5IHZhcmlhYmxlLiBJIHdvdWxkbid0IGNoYW5nZSB0aGlzIAo+IHRvIGJlIG1v
cmUgY29tcGxleCwgYWx0aG91Z2ggSSB3b3VsZCBkZXNpZ24gaXQgZGlmZmVyZW50bHksIGlmIEkg
d291bGQgCj4gaW1wbGVtZW50IHRoZSB0aGlzIGFzIGEgbmV3IHRlc3QuCj4gQW4gYWx0ZXJuYXRp
dmUgd291bGQgYmUgdG8gbm90IGJhY2tncm91bmQgdGhlIGxhc3QgbnMtdWRwc2VuZGVyIAo+IGV4
ZWN1dGlvbiwgYnV0IHRoYXQgY291bGQgYmUgYSBiaXQgb2JzY3VyZQoKT0sKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
