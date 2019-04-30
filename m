Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E1DFD5B
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 18:01:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C12773EACBD
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 18:01:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 301493EA09D
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 18:01:08 +0200 (CEST)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 31BC21A01490
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 18:01:06 +0200 (CEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3UFtNGu148546;
 Tue, 30 Apr 2019 16:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=nBQVFDaW2ozoo7jLhmYYjC8q7Xs7Lz6mD13x+kMG5Cs=;
 b=4L0ZDMCTe6dPiTtS9xUtSMGhxalptZQ+CcYe3/jVi+uaePOzw+bUiXCmfPKzq9VfCTxJ
 UBfT/FLhDT8dSsb66D4eh2gbVOj+f4XgLcaCvlFLDVGBzJEx7LRDyGitZgLnJkqiO/hB
 /6WKYr7tnKmfDNU2kqqDhOrsOyGR+vvswOtifwtPjp5lwNEAHjFZ4/u5FodXTOqbssq3
 8qPWA40YO6w5CsY+XWhtzfcP3tLlwqw/KuZgxpheSoVlNsGshBaHJBSKjr03fJamXVfF
 285vgH63ROd8pMc8yz1jAPiI2zHmu0jDmFmllK53pyKEpbayN3thYASNKt0Ry+xgDUp6 /g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 2s4ckddrc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 16:01:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3UG12vY143738;
 Tue, 30 Apr 2019 16:01:02 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2s5u512nmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 16:01:01 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3UG0vak000490;
 Tue, 30 Apr 2019 16:00:57 GMT
Received: from [192.168.1.111] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 30 Apr 2019 09:00:57 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190429072800.23067-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <5131c8d6-8092-5cba-f599-402e7e0dee98@oracle.com>
Date: Tue, 30 Apr 2019 19:00:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190429072800.23067-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904300098
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904300098
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] net/traceroute: Rewrite into new API
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

T24gMjkuMDQuMjAxOSAxMDoyNywgUGV0ciBWb3JlbCB3cm90ZToKPiBBZGQgaW5mbyBhYm91dCB0
cmFjZXJvdXRlIGZyb20gaXB1dGlscyBub3QgYmVpbmcgc3VwcG9ydGVkCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Cj4gLS0tCj4gIHRlc3RjYXNlcy9uZXR3
b3JrL3RyYWNlcm91dGUvdHJhY2Vyb3V0ZTAxLnNoIHwgNjMgKysrKysrKystLS0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvbmV0d29yay90cmFjZXJvdXRlL3RyYWNlcm91dGUwMS5z
aCBiL3Rlc3RjYXNlcy9uZXR3b3JrL3RyYWNlcm91dGUvdHJhY2Vyb3V0ZTAxLnNoCj4gaW5kZXgg
MWM4YjY2ZjU1Li44ZTlmNDZmNDUgMTAwNzU1Cj4gLS0tIGEvdGVzdGNhc2VzL25ldHdvcmsvdHJh
Y2Vyb3V0ZS90cmFjZXJvdXRlMDEuc2gKPiArKysgYi90ZXN0Y2FzZXMvbmV0d29yay90cmFjZXJv
dXRlL3RyYWNlcm91dGUwMS5zaAo+IEBAIC0xLDM5ICsxLDIwIEBACj4gICMhL2Jpbi9zaAo+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCj4gKyMgQ29weXJpZ2h0
IChjKSAyMDE5IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+ICAjIENvcHlyaWdodCAoYykg
MjAxNyBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLiBBbGwgUmlnaHRzIFJlc2VydmVkLgo+
ICAjIENvcHlyaWdodCAoYykgSW50ZXJuYXRpb25hbCBCdXNpbmVzcyBNYWNoaW5lcyAgQ29ycC4s
IDIwMDEKPiAtIwo+IC0jIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJl
ZGlzdHJpYnV0ZSBpdCBhbmQvb3IKPiAtIyBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwo+IC0jIHB1Ymxpc2hlZCBieSB0aGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mCj4gLSMgdGhlIExpY2Vu
c2UsIG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCj4gLSMKPiAtIyBUaGlz
IHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3b3VsZCBiZSB1c2Vm
dWwsCj4gLSMgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxp
ZWQgd2FycmFudHkgb2YKPiAtIyBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJU
SUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCj4gLSMgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
Zm9yIG1vcmUgZGV0YWlscy4KPiAtIwo+IC0jIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNv
cHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCj4gLSMgYWxvbmcgd2l0aCB0aGlz
IHByb2dyYW0uIElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KPiAg
Cj4gLVRTVF9UT1RBTD02Cj4gLVRDSUQ9InRyYWNlcm91dGUwMSIKPiAtVFNUX0NMRUFOVVA9ImNs
ZWFudXAiCj4gLQo+IC1UU1RfVVNFX0xFR0FDWV9BUEk9MQo+ICtUU1RfQ05UPTIKPiArVFNUX05F
RURTX0NNRFM9InRyYWNlcm91dGUiCj4gK1RTVF9TRVRVUD0ic2V0dXAiCj4gK1RTVF9URVNURlVO
Qz0idGVzdCIKClRTVF9ORUVEU19UTVBESVI9MT8KCgo+ICAuIHRzdF9uZXQuc2gKPiAgCj4gLWNs
ZWFudXAoKQo+IC17Cj4gLQl0c3Rfcm1kaXIKPiAtfQo+IC0KPiAgc2V0dXAoKQo+ICB7Cj4gLQl0
c3RfcmVzbSBUSU5GTyAidHJhY2Vyb3V0ZSB2ZXJzaW9uOiIKPiAtCXRzdF9yZXNtIFRJTkZPICQo
dHJhY2Vyb3V0ZSAtLXZlcnNpb24gMj4mMSkKPiAtCj4gLQl0c3RfdGVzdF9jbWRzIHRyYWNlcm91
dGUKPiAtCXRzdF90bXBkaXIKPiArCXRzdF9yZXMgVElORk8gInRyYWNlcm91dGUgdmVyc2lvbjoi
Cj4gKwl0c3RfcmVzIFRJTkZPICQodHJhY2Vyb3V0ZSAtLXZlcnNpb24gMj4mMSkKPiArCVsgIiRU
U1RfSVBWNiIgXSAmJiB0c3RfcmVzIFRJTkZPICJOT1RFOiB0cmFjZXBhdGg2IGZyb20gaXB1dGls
cyBpcyBub3Qgc3VwcG9ydGVkIgo+ICB9Cj4gIAo+ICBydW5fdHJhY2UoKQo+IEBAIC01MSwyNCAr
MzIsMzAgQEAgcnVuX3RyYWNlKCkKPiAgCWdyZXAgLXEgIiRieXRlcyBieXRlIiBvdXQubG9nCj4g
IAlpZiBbICQ/IC1uZSAwIF07IHRoZW4KPiAgCQljYXQgb3V0LmxvZwo+IC0JCXRzdF9yZXNtIFRG
QUlMICInJGJ5dGVzIGJ5dGUnIG5vdCBmb3VuZCIKPiArCQl0c3RfcmVzIFRGQUlMICInJGJ5dGVz
IGJ5dGUnIG5vdCBmb3VuZCIKPiAgCWVsc2UKPiAtCQl0c3RfcmVzbSBUUEFTUyAidHJhY2Vyb3V0
ZSB1c2UgJGJ5dGVzIGJ5dGVzIgo+ICsJCXRzdF9yZXMgVFBBU1MgInRyYWNlcm91dGUgdXNlICRi
eXRlcyBieXRlcyIKPiAgCWZpCj4gIAo+ICAJdGFpbCAtMSBvdXQubG9nIHwgZ3JlcCAtcUUgIiRw
YXR0ZXJuIgo+ICAJaWYgWyAkPyAtbmUgMCBdOyB0aGVuCj4gIAkJY2F0IG91dC5sb2cKPiAtCQl0
c3RfcmVzbSBURkFJTCAicGF0dGVybiAnJHBhdHRlcm4nIG5vdCBmb3VuZCBpbiBsb2ciCj4gKwkJ
dHN0X3JlcyBURkFJTCAicGF0dGVybiAnJHBhdHRlcm4nIG5vdCBmb3VuZCBpbiBsb2ciCj4gIAll
bHNlCj4gLQkJdHN0X3Jlc20gVFBBU1MgInRyYWNlcm91dGUgdGVzdCBjb21wbGV0ZWQgd2l0aCAx
IGhvcCIKPiArCQl0c3RfcmVzIFRQQVNTICJ0cmFjZXJvdXRlIHRlc3QgY29tcGxldGVkIHdpdGgg
MSBob3AiCj4gIAlmaQo+ICB9Cj4gIAo+IC1zZXR1cAo+IC10c3RfcmVzbSBUSU5GTyAicnVuIHRy
YWNlcm91dGUgd2l0aCBJQ01QIEVDSE8iCj4gLXJ1bl90cmFjZSAtSQo+IC10c3RfcmVzbSBUSU5G
TyAicnVuIHRyYWNlcm91dGUgd2l0aCBUQ1AgU1lOIgo+IC1ydW5fdHJhY2UgLVQKPiArdGVzdDEo
KQo+ICt7Cj4gKwl0c3RfcmVzIFRJTkZPICJydW4gdHJhY2Vyb3V0ZSB3aXRoIElDTVAgRUNITyIK
PiArCXJ1bl90cmFjZSAtSQo+ICt9Cj4gKwo+ICt0ZXN0MigpCj4gK3sKPiArCXRzdF9yZXMgVElO
Rk8gInJ1biB0cmFjZXJvdXRlIHdpdGggVENQIFNZTiIKPiArCXJ1bl90cmFjZSAtVAo+ICt9Cj4g
IAo+IC10c3RfZXhpdAo+ICt0c3RfcnVuCj4gCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
