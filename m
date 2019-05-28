Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1952C690
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 14:32:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3B0F3EA4E8
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 14:32:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5E3FE3EA1EF
 for <ltp@lists.linux.it>; Tue, 28 May 2019 14:32:36 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A89721001155
 for <ltp@lists.linux.it>; Tue, 28 May 2019 14:32:32 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4SCSS4T128453;
 Tue, 28 May 2019 12:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=corp-2018-07-02;
 bh=Hug3X4XMOhwGd6EjtuegZajU0yf5nKcPpRI+t5PrLjI=;
 b=LleYrFHOH/cFvrK51ERtwJdUkB1b1u/t58wfXenJe1KrKOwjzbWWTDdcN9w1XNVtUvIp
 2RO6fD+NygcEkH+jbCZEqSNTgMi/Y4gnKgtskIdSlYKLEK/nUuXEP3veRuo7mLcY4hJG
 X9k6+XQCbWh6diNCUMZNAQJF4M/IAp/TEc8tcXHeZb+ZZZ9lLescMFJubzq4d2Y9/dFc
 yZdsiwWBTKT9HQVnX4d4qDdLZptlfpDaKoeQVXWJwG23Q2I4IJzJHvpTW2rl4C6AU0pj
 Fu4c2fPLguLyAvzLGyziHWFe53k43wxF2FH3I0h2YQ7iLqpnFnwA1dVBC0n0shkZsm1P Mw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2spxbq2jj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 May 2019 12:32:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4SCWKcY085590;
 Tue, 28 May 2019 12:32:32 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2sqh732x6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 May 2019 12:32:32 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4SCWT0N014195;
 Tue, 28 May 2019 12:32:31 GMT
Received: from [192.168.1.111] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 28 May 2019 05:32:29 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190510183132.31039-1-pvorel@suse.cz>
Message-ID: <187fa31b-3295-6f1f-e330-1373b2fb4c66@oracle.com>
Date: Tue, 28 May 2019 15:32:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190510183132.31039-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9270
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905280082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9270
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905280082
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 0/6] net/route: Rewrite route{4,
 6}-change-{dst, gw} into C
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

SGkgUGV0ciwKCk9uIDUvMTAvMTkgOTozMSBQTSwgUGV0ciBWb3JlbCB3cm90ZToKPiBIaSwKPiAK
PiBhbm90aGVyIGF0dGVtcHQgdG8gcmV3cml0ZSByb3V0ZXs0LDZ9LWNoYW5nZS17ZHN0LGd3fS4K
PiBJJ20gbm90IG11Y2ggaGFwcHkgd2l0aCBpdC4KPiAKPiBJIHdhcyB0cnlpbmcgdG8gY3JlYXRl
IHNlcnZlciBzaWRlIHZhbGlkYXRpb24gb3ZlciBVRFAsIGJ1dCBmYWlsZWQuCj4gSSBkaWRuJ3Qg
ZmlndXJlIG91dCBzZXR1cCB3aGVyZSBzZXJ2ZXIgY291bGQgYmUgb24gc2luZ2xlIElQIGFkZHJl
c3MKPiAodGhlcmUgaXMgcHJvYmFibHkgYSBzb2x1dGlvbiksIHNvIEkgY3JlYXRlZCB0aHJlYWRz
LCBlYWNoIHRocmVhZCBiaW5kCj4gdG8gc2luZ2xlIElQIChudW1iZXIgb2YgdGhyZWFkcyBpcyB0
aGUgc2FtZSBhcyBudW1iZXIgb2YgSVAgYWRkcmVzc2VzCj4gY3JlYXRlZCBpbiBzaGVsbCkuIER1
ZSBsaW1pdGF0aW9uIG9mIElQdjYgcm91dGVzIG92ZXIgZ2F0ZXdheSAod2hpY2gKPiBtdXN0IGJl
IG9uIHJob3N0LCBmb3IgdGVzdHN1aXRlIGNoYW5naW5nIGRlc3RpbmF0aW9uIHRoaXMgaXMgbm90
Cj4gbmVjZXNzYXJ5KSBJIHJ1biBzZXJ2ZXIgb24gcmhvc3QuIFRlc3RzdWl0ZSBnb3QgY29tcGxp
Y2F0ZWQ6Cj4gd2FpdGluZyBmb3IgdGhyZWFkcyB0byBiaW5kLCBzYXZlIHBvcnQgYW5kIElQIGNv
bmZpZyBpbnRvIGZpbGVzCj4gYW5kIGxvYWQgaXQgaW4gY2xpZW50Li4uID0+IHVuZmluaXNoZWQg
YW5kIHBvc3RlZCBzb2x1dGlvbiB3aXRob3V0IHNlcnZlci4KPiBJIGNhbiBzZWUgcGFja2V0cyBz
ZW50IHdpdGggdGNwZHVtcCwgYnV0IHRoYXQgZG9lcyBub3QgbWVhbiBpdCByZWFjaGVkCj4gc2Vy
dmVyLiBXaXRoIHRoaXMgcmVzdWx0IGl0J3MgcXVlc3Rpb25hYmxlIHdoZXRoZXIgbW92aW5nIGlu
dG8gQyBjb2RlIGlzCj4gYSBiZW5lZml0LCBtYXliZSBzaGVsbCBjb2RlIGJlbG93IGlzIGp1c3Qg
Z29vZCBlbm91Z2guCj4gCj4gT3RoZXIgcXVlc3Rpb25hYmxlIHRoaW5nIGlzIHRzdF9pcGFkZHJf
dW4oKSBpbmNvbXBsZXRlIGltcGxlbWVudGF0aW9uIGluIEMuCj4gQWx0ZXJuYXRpdmVseSBJUCBh
ZGRyZXNzZXMgY291bGQgYmUgcGFzc2VkIGZyb20gc2hlbGwgdmlhIGdldG9wdHMsIGJ1dAo+IHRo
YXQgY2FuIGJlIGhhcmQgdG8gZGVidWcgKHRvbyBsb25nIGFyZ3VtZW50IHBhc3NlZCkuCj4gT3Jp
Z2luYWxseSBJIHdhbnRlZCB0byBjcmVhdGUgSVAgYWRkcmVzc2VzIGFsc28gaW4gQywgYnV0IHRo
YXQncyBub3QKPiBwb3NzaWJsZSBkdWUgcmhvc3Qgbm90IHJlYWNoYWJsZSBmcm9tIEMuCj4gCj4g
Q2hhbmdlcyBmcm9tIHYxOgo+ICogSGFuZGxlIGFsc28gcm91dGV7NCw2fS1jaGFuZ2UtZ3cKPiAq
IFVzZSBsaWJtbmwKPiAqIG5ldyBjb21taXRzIChtb3JlIGNvbW1lbnRzIGF0IHRoZSBjb21taXRz
KToKPiAtIG5ldDogTW92ZSBzZXR1cF9hZGRyaW5mbygpIGZyb20gbmV0c3RyZXNzLmMgaW50byB0
c3RfbmV0LmgKPiAtIHRzdF9uZXQuc2g6IE1pbm9yIGNvZGUgYW5kIGRvYyBjbGVhbnVwCj4gLSB0
c3RfbmV0LnNoOiBBZGQgLWEgSVAgYW5kIC1zIG9wdGlvbnMgdG8gdHN0X2luaXRfaWZhY2UoKQo+
IC0gbmV0OiBJbnRyb2R1Y2UgVFNUX0dFVF9VTlVTRURfUE9SVCgpIG1hY3JvIGludG8gQyBBUEkK
PiAtIG5ldC9yb3V0ZTogUmVtb3ZlIHJvdXRlezQsNn0tY2hhbmdlLWlmCj4gCj4gRHJhZnQgb2Yg
YWx0ZXJuYXRpdmUgaW1wbGVtZW50YXRpb24gaW4gc2hlbGw6Cj4gKiByb3V0ZS1jaGFuZ2UtZHN0
Cj4gVFNUX1RFU1RGVU5DPSJkb190ZXN0Igo+IFRTVF9TRVRVUD0iZG9fc2V0dXAiCj4gVFNUX0NM
RUFOVVA9InJlc3RvcmVfaXBhZGRyIgo+IFRTVF9ORUVEU19DTURTPSJpcCIKPiBUU1RfQ05UPSRO
U19USU1FUwo+IAo+IC4gdHN0X25ldF9zdHJlc3Muc2gKPiAKPiBkb19zZXR1cCgpCj4gewo+IAkj
IEZJWE1FOiByZW1vdmUgZHVwbGljaXR5Cj4gCW1hc2s9JElQVjRfTFBSRUZJWAo+IAl1ZHBfc2l6
ZT0xNDcyCj4gCWlmIFsgIiRUU1RfSVBWNiIgXTsgdGhlbgo+IAkJbWFzaz0kSVBWNl9MUFJFRklY
Cj4gCQl1ZHBfc2l6ZT0xNDUyCj4gCWZpCj4gCW5ldHN0cmVzc19zZXR1cAo+IAl0c3RfcmVzIFRJ
TkZPICJjaGFuZ2UgSVB2JFRTVF9JUFZFUiByb3V0ZSBkZXN0aW5hdGlvbiAkTlNfVElNRVMgdGlt
ZXMiCj4gfQo+IAo+IGRvX3Rlc3QoKQo+IHsKPiAJbG9jYWwgaWZhY2U9JCh0c3RfaWZhY2UpCj4g
CWxvY2FsIGFkZHIgbmV3X3J0Cj4gCj4gCW5ld19ydD0iJCh0c3RfaXBhZGRyX3VuICQxKS8kbWFz
ayIKPiAJYWRkcj0iJCh0c3RfaXBhZGRyX3VuICQxIDEpIgo+IAo+IAl0c3RfcmVzIFRJTkZPICJ0
ZXN0aW5nIHJvdXRlICckbmV3X3J0JyIKPiAKPiAJdHN0X3Job3N0X3J1biAtcyAtYyAiaXAgYWRk
ciBhZGQgJGFkZHIvJG1hc2sgZGV2ICQodHN0X2lmYWNlIHJob3N0KSIKPiAJUk9EIGlwIHJvdXRl
IGFkZCAkbmV3X3J0IGRldiAkaWZhY2UKPiAJUk9EIGlwIG5laWdoIHJlcGxhY2UgJGFkZHIgbGxh
ZGRyICQodHN0X2h3YWRkciByaG9zdCkgbnVkIHBlcm1hbmVudCBkZXYgJGlmYWNlCj4gPiAJRVhQ
RUNUX1BBU1MgbnMtdWRwc2VuZGVyIC1mICRUU1RfSVBWRVIgLUQgJGFkZHIgLXAgJDEgLW8gLXMg
JHVkcF9zaXplCj4gCj4gCVJPRCBpcCBuZWlnaCBkZWwgJGFkZHIgbGxhZGRyICQodHN0X2h3YWRk
ciByaG9zdCkgZGV2ICRpZmFjZQo+IAlST0QgaXAgcm91dGUgZGVsICRuZXdfcnQgZGV2ICRpZmFj
ZQo+IAl0c3Rfcmhvc3RfcnVuIC1jICJpcCBhZGRyIGRlbCAkYWRkci8kbWFzayBkZXYgJCh0c3Rf
aWZhY2Ugcmhvc3QpIgoKV2l0aCBucy11ZHBzZW5kZXIsIEkgdGhpbmsgaXQgY2FuIGJlIHdpdGhv
dXQgc2V0dGluZyBpcCBhZGRyZXNzZXM6CiAJUk9EIGlwIHJvdXRlIGFkZCAkbmV3X3J0IGRldiAk
aWZhY2UKIAlST0QgaXAgbmVpZ2ggcmVwbGFjZSAkYWRkciBsbGFkZHIgJCh0c3RfaHdhZGRyIHJo
b3N0KSBudWQgcGVybWFuZW50IGRldiAkaWZhY2UKIAlFWFBFQ1RfUEFTUyBucy11ZHBzZW5kZXIg
LWYgJFRTVF9JUFZFUiAtRCAkYWRkciAtcCAkMSAtbyAtcyAkdWRwX3NpemU+IAoJUk9EIGlwIG5l
aWdoIGRlbCAkYWRkciBsbGFkZHIgJCh0c3RfaHdhZGRyIHJob3N0KSBkZXYgJGlmYWNlCiAJUk9E
IGlwIHJvdXRlIGRlbCAkbmV3X3J0IGRldiAkaWZhY2UKCkJ1dCB3aXRoIHBpbmcgYW5kIG5laWdo
Ym9yIGRpc2NvdmVyeToKIAl0c3Rfcmhvc3RfcnVuIC1zIC1jICJpcCBhZGRyIGFkZCAkYWRkci8k
bWFzayBkZXYgJCh0c3RfaWZhY2Ugcmhvc3QpIgogCVJPRCBpcCByb3V0ZSBhZGQgJG5ld19ydCBk
ZXYgJGlmYWNlCiAJRVhQRUNUX1BBU1MgcGluZyRUU1RfSVBWRVIgLi4uCiAJUk9EIGlwIHJvdXRl
IGRlbCAkbmV3X3J0IGRldiAkaWZhY2UKIAl0c3Rfcmhvc3RfcnVuIC1jICJpcCBhZGRyIGRlbCAk
YWRkci8kbWFzayBkZXYgJCh0c3RfaWZhY2Ugcmhvc3QpIgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
