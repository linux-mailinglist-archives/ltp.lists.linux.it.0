Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FC42DBF39
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 12:10:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0C943C3358
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 12:10:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4632B3C2A8B
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 12:10:45 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4F3451A00E12
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 12:10:45 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BGB40JV087247;
 Wed, 16 Dec 2020 11:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=HOab0dthFlNPS/g81N/OqUGCVh4MVw+Fop/aK5kA+tA=;
 b=x3+THFEQQEp/8hRU4Sccky7fq5bHNJ+P5nYthxQb7bb1FDed5dHL2+pIYbM96cr8tXc+
 sKCMt/5C+4yUF/XP/ACUApEnqCIKy68NNGe1CARGIk8jGuJBZl11QtTKQO1FG+ic8nk5
 SQAJg3WsQYqKIS2FIFuXc1Aj+k5Yk21LLdhJsyPzJpYsBqegbjMl9KkPDSFAEGM+1HoH
 Klq98xvcxFjfDn+Sfz8un3RcQKZA8tK6Tp/zjOKZHm53stYXnq8O11WsQZKd0zDyYuXX
 sZTaOblITDkCnw/gpMpmgMPIWDWs1pbvYzXCr/pczGhoGZcisdWYurLMJ8stb3oJ9lhf Ig== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35ckcbfqw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Dec 2020 11:10:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BGB5AEw134208;
 Wed, 16 Dec 2020 11:10:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 35e6jsjng4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 11:10:39 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BGBAaaS014281;
 Wed, 16 Dec 2020 11:10:36 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Dec 2020 03:10:36 -0800
To: =?UTF-8?Q?K=c3=b6ry_Maincent?= <kory.maincent@bootlin.com>
References: <20201216094037.5886-1-kory.maincent@bootlin.com>
 <6abb1c7a-47d7-97dd-96c2-665c1030a554@oracle.com>
 <20201216115558.2964253d@kmaincent-XPS-13-7390>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <adc0cd36-8b6b-7323-7d08-d997f2f146e2@oracle.com>
Date: Wed, 16 Dec 2020 14:10:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216115558.2964253d@kmaincent-XPS-13-7390>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160071
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ipsec_lib.sh: test xfrm_user driver locally
 before rhost
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
Cc: thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMTYuMTIuMjAyMCAxMzo1NSwgS8O2cnkgTWFpbmNlbnQgd3JvdGU6Cj4gSGVsbG8gQWxleGV5
LAo+IAo+IE9uIFdlZCwgMTYgRGVjIDIwMjAgMTM6MzE6MzYgKzAzMDAKPiBBbGV4ZXkgS29kYW5l
diA8YWxleGV5LmtvZGFuZXZAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gCj4+IE9uIDE2LjEyLjIwMjAg
MTI6NDAsIEtvcnkgTWFpbmNlbnQgd3JvdGU6Cj4+PiBGaXJzdCwgdGVzdCB0aGUgcHJlc2VuY2Ug
b2YgdGhlIGRyaXZlciBsb2NhbGx5IHRvIGF2b2lkIGEgbWlzbGVhZGluZyBUV0FSTgo+Pj4gZnJv
bSB0c3RfbmV0X3J1biBpbiBjYXNlIG9mIGRyaXZlciBub3QgcHJlc2VudC4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBLb3J5IE1haW5jZW50IDxrb3J5Lm1haW5jZW50QGJvb3RsaW4uY29tPgo+Pj4g
LS0tCj4+PiAgdGVzdGNhc2VzL25ldHdvcmsvc3RyZXNzL2lwc2VjL2lwc2VjX2xpYi5zaCB8IDUg
KysrLS0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvbmV0d29yay9zdHJlc3MvaXBzZWMvaXBz
ZWNfbGliLnNoCj4+PiBiL3Rlc3RjYXNlcy9uZXR3b3JrL3N0cmVzcy9pcHNlYy9pcHNlY19saWIu
c2ggaW5kZXggMTk4YzkzMTVkLi4xZGI1ZmM2YWYKPj4+IDEwMDY0NCAtLS0gYS90ZXN0Y2FzZXMv
bmV0d29yay9zdHJlc3MvaXBzZWMvaXBzZWNfbGliLnNoCj4+PiArKysgYi90ZXN0Y2FzZXMvbmV0
d29yay9zdHJlc3MvaXBzZWMvaXBzZWNfbGliLnNoCj4+PiBAQCAtODMsOCArODMsOSBAQCBpcHNl
Y19saWJfc2V0dXAoKQo+Pj4gIAlBTEdSPQo+Pj4gIAo+Pj4gIAlpZiBbIC1uICIkSVBTRUNfTU9E
RSIgXTsgdGhlbgo+Pj4gLQkJdHN0X25ldF9ydW4gInRzdF9jaGVja19kcml2ZXJzIHhmcm1fdXNl
ciIgfHwgXAo+Pj4gLQkJCXRzdF9icmsgVENPTkYgInhmcm1fdXNlciBkcml2ZXIgbm90IGF2YWls
YWJsZSBvbgo+Pj4gbGhvc3Qgb3Igcmhvc3QiCj4+PiArCQl0c3RfY2hlY2tfZHJpdmVycyB4ZnJt
X3VzZXIgfHwgdHN0X2JyayBUQ09ORiAieGZybV91c2VyCj4+PiBkcml2ZXIgbm90IGF2YWlsYWJs
ZSIKPj4+ICsJCXRzdF9yaG9zdF9ydW4gLWMgInRzdF9jaGVja19kcml2ZXJzIHhmcm1fdXNlciIg
fHwgXAo+Pj4gKwkJCXRzdF9icmsgVENPTkYgInhmcm1fdXNlciBkcml2ZXIgbm90IGF2YWlsYWJs
ZSBvbgo+Pj4gcmhvc3QiICAKPj4KPj4gSGkgS29yeSwKPj4KPj4gdHN0X25ldF9ydW4oKSBjaGVj
a3MgdGhlIGRyaXZlciBsb2NhbGx5IGZpcnN0LCBzbyBJIGRvbid0Cj4+IHF1aXRlIHVuZGVyc3Rh
bmQgd2h5IGRvIGV4YWN0bHkgdGhlIHNhbWUgd2hhdCB0c3RfbmV0X3J1bigpCj4+IHN1cHBvc2Vk
IHRvIGRvPwo+IAo+IEluZGVlZCBidXQgaXQgcmV0dXJucyBhIFRXQVJOIGJlY2F1c2UgdGhlIGNv
bW1hbmQgInRzdF9jaGVja19kcml2ZXJzIHhmcm1fdXNlciIKPiBub3QgZW5kIHByb3Blcmx5LCBi
dXQgaW4gZmFjdCBpdCBzaG91bGQgcmV0dXJuIGEgVENPTkYgZHVlIHRvIHRoZSBtaXNzaW5nCj4g
eGZybV9kcml2ZXJzLgo+IEluIHRoZSBmaW5hbCByZXN1bHQgZmlsZSB3ZSBnb3QgYSBGQUlMIGVy
cm9yIHdpdGggdGhlIHZhbHVlIDM2IGluIHBsYWNlIG9mIGEKPiBDT05GIHdpdGggdmFsdWUgMzIg
d2hpY2ggc2hvdWxkIGJlIHRoZSByaWdodCBtZXNzYWdlLgo+IAoKUGVyaGFwcyBpdCBuZWVkcyAt
cSBvcHRpb24gaGVyZToKCnRzdF9uZXRfcnVuIC1xICJ0c3RfY2hlY2tfZHJpdmVycyB4ZnJtX3Vz
ZXIiIC4uLiBzbyBpdCBza2lwcyBUV0FSTj8KCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
