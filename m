Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5666FD15
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 17:42:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2FCB3EACCB
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 17:42:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E3FEF3EAC9D
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 17:42:54 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 59BC51401A40
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 17:42:53 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3UFYSKr141507;
 Tue, 30 Apr 2019 15:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=99BgS9mNMTBRye59ucx2EKQGgAfosJbfvjRTmoyoW88=;
 b=D3OO8sZ2DHyuAzEtGf1wfjp+pBQteA0QVh6ewtsxWqM5ZdMTbBcs1To2t+6QQSvXDAv9
 CC/c5DYxYsS1mf3o9QK/XyAcy4Y5KMv47TNwpgETfW8+2Ue5p+d6b5HfTPXg0rm9WyuA
 pkmH1aDmfpuFqnEX6fAkBNlN3MM7523bcHXE8ANiUMedyLCorKWdUs+G/u2/k9eqbbmn
 jpTRTsHLhO82/aDeSaya8HLXZsGXBU1d0LT9ONE/E+vCIS9TfAPnfbCP8qB2dNCKUwSo
 bq6Vs55zC+MSOb0bSuW5S3zTnOtC2Yn8DD4R0iI5wB/BFLaFbf+z8iDauMo5K1vmlGty ng== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2s4fqq5b3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 15:42:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3UFgi1N174145;
 Tue, 30 Apr 2019 15:42:49 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2s4ew1akvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 15:42:49 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3UFgguE006517;
 Tue, 30 Apr 2019 15:42:48 GMT
Received: from [192.168.1.111] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 30 Apr 2019 08:42:42 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190427053929.7372-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <5cff91e0-c566-27c3-95dd-39dd4e2b6d0e@oracle.com>
Date: Tue, 30 Apr 2019 18:42:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190427053929.7372-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904300096
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904300096
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/broken_ip: Rewrite into new API
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

SGkgUGV0ciwKT24gMjcuMDQuMjAxOSAwODozOSwgUGV0ciBWb3JlbCB3cm90ZToKPiBSZW1vdmUg
SVAgdmVyc2lvbiBmcm9tIGZpbGVuYW1lIGFzIGZpbGVzIGFyZSBmb3IgYm90aCBJUHY0IGFuZCBJ
UHY2Cj4gKGFsdGhvdWdoIG5vdCBhbGwgYXJlIHVzZWQgZm9yIGJvdGggdmVyc2lvbnMpLgo+IAo+
ICsgQWRkIHBhY2tldCByZWxhdGVkIHZhcmlhYmxlcyB0byB0c3RfbmV0LnNoICgkSUNNUFZ7NCw2
LH1fREFUQV9NQVhTSVpFKQo+IGFuZCB1c2UgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ciBW
b3JlbCA8cHZvcmVsQHN1c2UuY3o+Cj4gLS0tCgpBY2tlZC1ieTogQWxleGV5IEtvZGFuZXYgPGFs
ZXhleS5rb2RhbmV2QG9yYWNsZS5jb20+CgouLi4KPiBAQCAtNTksNiArNTksMTQgQEAgdHN0X25l
dF9zZXR1cCgpCj4gIHsKPiAgCXRzdF9uZXRfcmVtb3RlX3RtcGRpcgo+ICAJWyAtbiAiJFRTVF9T
RVRVUF9DQUxMRVIiIF0gJiYgJFRTVF9TRVRVUF9DQUxMRVIKPiArCj4gKwlpZiBbIC16ICIkSUNN
UF9EQVRBX01BWFNJWkUiIF07IHRoZW4KPiArCQlpZiBbICIkVFNUX0lQVjYiIF07IHRoZW4KPiAr
CQkJSUNNUF9EQVRBX01BWFNJWkU9IiRJQ01QVjZfREFUQV9NQVhTSVpFIgo+ICsJCWVsc2UKPiAr
CQkJSUNNUF9EQVRBX01BWFNJWkU9IiRJQ01QVjRfREFUQV9NQVhTSVpFIgo+ICsJCWZpCj4gKwlm
aQo+ICB9Cj4gIAo+ICBbIC1uICIkVFNUX1VTRV9MRUdBQ1lfQVBJIiBdICYmIC4gdGVzdC5zaCB8
fCAuIHRzdF90ZXN0LnNoCj4gQEAgLTgyMCw2ICs4MjgsOSBAQCBleHBvcnQgVFNUX05FVF9NQVhf
UEtUPSIke1RTVF9ORVRfTUFYX1BLVDotJCh0c3RfZGVmYXVsdF9tYXhfcGt0KX0iCj4gIGV4cG9y
dCBMSE9TVF9IV0FERFJTPSIke0xIT1NUX0hXQUREUlM6LSQodHN0X2dldF9od2FkZHJzIGxob3N0
KX0iCj4gIGV4cG9ydCBSSE9TVF9IV0FERFJTPSIke1JIT1NUX0hXQUREUlM6LSQodHN0X2dldF9o
d2FkZHJzIHJob3N0KX0iCj4gIAo+ICtleHBvcnQgSUNNUFY0X0RBVEFfTUFYU0laRT0xNDcyCj4g
K2V4cG9ydCBJQ01QVjZfREFUQV9NQVhTSVpFPTE0NTIKClNpbmNlIHRoZXNlIHZhcmlhYmxlcyBh
cmUgaW4gdGhlIGxpYnJhcnksIG1heSBiZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdHVuZQp0aGVt
IGRlcGVuZGluZyBvbiBhbiBNVFUgb2YgdGhlIHRlc3RzIGludGVyZmFjZXM/CgpBbHNvIHdlIGNh
biBzZW5kIG1vcmUgd2l0aCBmcmFnbWVudGF0aW9uLCBidXQgSSBndWVzcyBucy1pY21wdiBkb2Vz
bid0CmhhdmUgcHJvcGVyIHN1cHBvcnQuLi4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
