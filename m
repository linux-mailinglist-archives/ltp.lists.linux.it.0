Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3788E45BF5
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 13:59:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 110042988DF
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 13:59:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C74A4294A36
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 13:59:09 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D56561A01A55
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 13:59:08 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5EBx7YW005970;
 Fri, 14 Jun 2019 11:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=YzWkoo/lNysQRV3QC+Am7Dbs+UNzT99wtpKrlRWyQtk=;
 b=ds02LMVLwmsyHfxh5tmuuk+/pRHRswDk6aPvcpuTEju9dkJY3zd9gXR18jk4ZsU7aUCx
 8THyZChdlok8JrdNYyIEu14Mg7Qp97B3MYzjpsFsPP0MEYahOV1UjEZ+wMlWa9rgsczu
 p6NdO80L0IL49ygcOcLLOY1eiCB6vvXKEhPgRrk1xj2RXedOcyZcXwwUT653XTflvLOA
 khsbhBaPkk0IScgTksibkRJ5Eas/A6OuVR+vL9eB5jxD3Eq5zjCo+rG82tULAk4e0wh1
 CMip9lWM8uzjkUPcbpYiwL3GEJXmaZsdB3BJeTBmfOuIOwiv3To0+eAjs4ZCJaXNNm4D 8g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2t04eu73wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2019 11:59:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5EBx1h3099846;
 Fri, 14 Jun 2019 11:59:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2t1jpk3tb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2019 11:59:06 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5EBx5QR001911;
 Fri, 14 Jun 2019 11:59:05 GMT
Received: from [192.168.1.111] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 14 Jun 2019 04:59:05 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190510183132.31039-1-pvorel@suse.cz>
 <20190510183132.31039-7-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <5ae7fa5e-5a95-dd7b-a4cf-b4f6f699804a@oracle.com>
Date: Fri, 14 Jun 2019 14:59:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190510183132.31039-7-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9287
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906140102
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9287
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906140102
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 6/6] net/route: Rewrite route{4,
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

T24gMTAuMDUuMjAxOSAyMTozMSwgUGV0ciBWb3JlbCB3cm90ZToKPiBDb2RlOgo+ICogdXNlIGxp
Ym1ubCBhbmQgbmV3IEMgQVBJCj4gKiByZXVzZSBjb2RlIGluIHRzdF9uZXQuaCAoYWRkZWQgaW4g
cHJldmlvdXMgY29tbWl0KQo+ICogYWRkIHNoZWxsIHdyYXBwZXIgKHNldCBlbnZpcm9ubWVudCB3
aXRoIHRzdF9uZXQuc2ggaW5zdGVhZCBvZiB1c2luZwo+ICAgZGVwcmVjYXRlZCBoZWxwZXJzIGlu
IHRlc3RjYXNlcy9uZXR3b3JrL3N0cmVzcy9ucy10b29scy8pCj4gKiBBZGQgdHN0X2lwYWRkcl91
bigpIGludG8gQyBBUEksIHVubGlrZSBzaGVsbCBBUEkgdGhpcyBpbXBsZW1lbnRhdGlvbgo+ICAg
ZG9lcyBub3Qgc3VwcG9ydCAtYyB0c3RfaXBhZGRyX3VuIFstY0NPVU5URVJdIFtUWVBFXSBzeW50
YXguCj4gCj4gVHJhdmlzOgo+ICogYWRkIGxpYm1ubCBsaWJyYXJpZXMgdG8gbW9zdCBvZiB0cmF2
aXMgam9icwo+ICogcmVwbGFjZSBzcGFjZXMgd2l0aCB0YWJzIHNvbWUgdHJhdmlzIHNoZWxsIGZp
bGVzCj4gCj4gQ2xlYW51cDoKPiAqIGNsZWFudXAgdGVzdCBkZXNjcmlwdGlvbgo+ICogb3RoZXIg
Y2xlYW51cAo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+
IC0tLQouLi4KPiArfQo+ICsKPiArc3RhdGljIHZvaWQgc2VuZF91ZHAoY2hhciAqbG9jYWwsIGNo
YXIgKnJlbW90ZSkKPiArewo+ICsJZmQgPSBTQUZFX1NPQ0tFVChmYW1pbHksIFNPQ0tfREdSQU0s
IElQUFJPVE9fVURQKTsKPiArCj4gKwlzdHJ1Y3QgYWRkcmluZm8gaGludHM7Cj4gKwltZW1zZXQo
JmhpbnRzLCAwLCBzaXplb2Yoc3RydWN0IGFkZHJpbmZvKSk7Cj4gKwloaW50cy5haV9mYW1pbHkg
PSBmYW1pbHk7Cj4gKwloaW50cy5haV9zb2NrdHlwZSA9IFNPQ0tfREdSQU07Cj4gKwloaW50cy5h
aV9mbGFncyA9IDA7Cj4gKwloaW50cy5haV9wcm90b2NvbCA9IDA7Cj4gKwloaW50cy5haV9hZGRy
ID0gSU5BRERSX0FOWTsKPiArCXNldHVwX2FkZHJpbmZvKGxvY2FsLCBOVUxMLCAmaGludHMsICZs
b2NhbF9hZGRyaW5mbyk7Cj4gKwljaGFyICpwb3J0Owo+ICsJaW50IF9wb3J0ID0gVFNUX0dFVF9V
TlVTRURfUE9SVChmYW1pbHksIFNPQ0tfREdSQU0pOwo+ICsJU0FGRV9BU1BSSU5URigmcG9ydCwg
IiVkIiwgX3BvcnQpOwo+ICsJc2V0dXBfYWRkcmluZm8ocmVtb3RlLCBwb3J0LCAmaGludHMsICZy
ZW1vdGVfYWRkcmluZm8pOwo+ICsKCkdldHRpbmcgbG9jYWwgdW51c2VkIHBvcnQgYW5kIHVzaW5n
IGFzIGEgcmVtb3RlIHBvcnQ/CgoKPiArCVNBRkVfQklORChmZCwgbG9jYWxfYWRkcmluZm8tPmFp
X2FkZHIsIGxvY2FsX2FkZHJpbmZvLT5haV9hZGRybGVuKTsKPiArCgpUU1RfR0VUX1VOVVNFRF9Q
T1JUIGFuZCBTQUZFX0JJTkQgbG9vayByZWR1bmRhbnQsIHdoYXQgaXMgdGhlIHB1cnBvc2UgdG8g
dXNlCnRoZW0gaGVyZT8KCj4gKwlTQUZFX1NFTkRUTygxLCBmZCwgcmVtb3RlLCBzdHJsZW4ocmVt
b3RlKSwgTVNHX0NPTkZJUk0sCj4gKwkJcmVtb3RlX2FkZHJpbmZvLT5haV9hZGRyLCByZW1vdGVf
YWRkcmluZm8tPmFpX2FkZHJsZW4pOwo+ICsKPiArCWNsb3NlKGZkKTsKPiArfQo+ICsKPiArc3Rh
dGljIHZvaWQgcnVuKHZvaWQpCj4gK3sKPiArCWludCBpLCBqOwo+ICsJY2hhciAqZGVzdGluYXRp
b24sICpnYXRld2F5ID0gTlVMTCwgKmxvY2FsLCAqcmVtb3RlOwo+ICsKPiArCXRzdF9yZXMoVElO
Rk8sICJBZGRpbmcgYW5kIGRlbGV0aW5nIHJvdXRlIHdpdGggZGlmZmVyZW50IGRlc3RpbmF0aW9u
ICVkIHRpbWVzIiwgbnVtX2xvb3BzKTsKPiArCWZvciAoaSA9IDA7IGkgPCBudW1fbG9vcHM7IGkr
Kykgewo+ICsJCWogPSBpICUgbWF4X2lwOwo+ICsJCWxvY2FsID0gdHN0X2lwYWRkcl91bihmYW1p
bHksIGosIGxob3N0KTsKPiArCQlyZW1vdGUgPSB0c3RfaXBhZGRyX3VuKGZhbWlseSwgaiwgcmhv
c3QpOwo+ICsJCWlmIChnX29wdCkgewo+ICsJCQlkZXN0aW5hdGlvbiA9IHRzdF9pcGFkZHJfdW4o
ZmFtaWx5LCAwLCAwKTsKPiArCQkJZ2F0ZXdheSA9IHRzdF9pcGFkZHJfdW4oZmFtaWx5LCBqLCBn
d2hvc3QpOwo+ICsJCX0gZWxzZSB7Cj4gKwkJCWRlc3RpbmF0aW9uID0gdHN0X2lwYWRkcl91bihm
YW1pbHksIGosIDApOwo+ICsJCX0KPiArCj4gKwkJcnRubF9yb3V0ZShpZmFjZSwgZGVzdGluYXRp
b24sIHByZWZpeCwgZ2F0ZXdheSwgUlRNX05FV1JPVVRFKTsKPiArCQlzZW5kX3VkcChsb2NhbCwg
cmVtb3RlKTsKPiArCQlydG5sX3JvdXRlKGlmYWNlLCBkZXN0aW5hdGlvbiwgcHJlZml4LCBnYXRl
d2F5LCBSVE1fREVMUk9VVEUpOwo+ICsJfQo+ICsKPiArCXRzdF9yZXMoVFBBU1MsICJSb3V0ZXMg
Y3JlYXRlZCBhbmQgZGVsZXRlZCIpOwo+ICt9Cj4gKwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
