Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B84F52DC005
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 13:10:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70E2D3C4AEA
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 13:10:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B441E3C2607
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 13:10:26 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 97B35200224
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 13:10:21 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BGC9up6012918;
 Wed, 16 Dec 2020 12:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=rgscP3u7m1lcCV3MvVwhywAClK26CK0+Qz9leH4iYCM=;
 b=JuC11mNO318eDUI6QT1oWJMD/Mvfrxw2pPOIFiaM1dHvzoK4ROlTAQr1KVpjC7m2NvEN
 Vj5vVlyx86tr4wgLywFOuTS4qqb9/EROtJq0TtGXMEsFXGvEpAYh7gICYUNfPuNz4RLL
 CLYKcLNV2HEl4cnoC4EOgbdBDZv+dw8AEC7IqTxCmG3IswC1ePJM39y7PanQieSPuFyH
 abnODMJaGyXh5I92pwDhPrUxyc3ZDiJmA6RQb+r4ZiB8WJpEgGm0SCIJJO033KXQNNPL
 HXs6LdZG3KsuR9mKFMmd4f2YFEnONqak4Vsfze0QHppNHyQVvTCDgKbI81WzN4Bb/Rhl kQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35ckcbfxgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Dec 2020 12:10:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BGC5Apg117157;
 Wed, 16 Dec 2020 12:08:19 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 35e6jsmf5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 12:08:18 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BGC8HhF024802;
 Wed, 16 Dec 2020 12:08:17 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Dec 2020 04:08:17 -0800
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20201215190545.19939-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <53607e8b-176f-5aaf-4b5f-9efabd1d756f@oracle.com>
Date: Wed, 16 Dec 2020 15:08:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215190545.19939-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160079
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] if-mtu-change.sh: Add max packet size
 detection for IPv4
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMTUuMTIuMjAyMCAyMjowNSwgUGV0ciBWb3JlbCB3cm90ZToKPiBBbHRob3VnaCB0aGVvcmV0
aWNhbCBtYXhpbXVtIElQIHBhY2tldCBzaXplIGlzIDY1NTA3LCB0aGlzIGRvZXMgbm90IHdvcmsK
PiBvbiBzMzkweCBvbiBsb3cgTVRVLiBCdXQgYWNjb3JkaW5nIHRvIFdlbmppYSBaaGFuZyB0aGUg
c2FtZSBwcm9ibGVtIGlzCj4gb24gbW9yZSBwbGF0Zm9ybXMsIGUuZy4geDg2Ogo+IAo+IEEgYmln
IElQIHBhY2tldCBpcyBmcmFnbWVudGVkIGludG8gc21hbGwgcGFja2V0cyBhY2NvcmRpbmcgdG8g
dGhlIE1UVQo+IHNpemUuICBFYWNoIHNtYWxsIHBhY2tldCBjb25zdW1lcyBhbiBhbW91bnQgb2Yg
c3lzdGVtIG1lbW9yeSwgd2hpY2ggYXJlCj4gcmVjb3JkZWQgaW4g4oCYc2tiLT50cnVlc2l6ZeKA
mS4gQW5kIHRoZSBzdW0gb2YgdGhlIHNwYWNlIGFsbCBvZiB0aGUgc21hbGwKPiBwYWNrZXRzIG5l
ZWQgaXMgbGltaXRlZCBieSDigJgyICogc2stPnNrX3NuZGJ1ZuKAmSAod2hpY2ggeW91IGNhbiBm
aW5kIGluCj4gJ19faXBfYXBwZW5kX2RhdGEnIGZ1bmN0aW9uIGluIG5ldC9pcHY0L2lwX291dHB1
dC5jKSwgdGhhdCBpcyBpbmhlcml0ZWQKPiBmcm9tIHRoZSBzeXN0ZW0gZGVmYXVsdCBzZXQgZHVy
aW5nIHNvY2tldCBpbml0aWFsaXphdGlvbi4gVGhlIHByb2JsZW0gb24KPiBzMzkwIGlzIHRoYXQg
4oCYc2tiLT50cnVlc2l6ZeKAmSBpcyBnb3QgYnkgYWxpZ25pbmcgdGhlIHNpemUgb2YgdGhlIGRh
dGEKPiBidWZmZXIgdG8gdGhlIEwxIGNhY2hlIGxpbmUgKHVzaW5nIFNLQl9EQVRBX0FMSUdOKSwg
d2hpY2ggb24gczM5MCBhbmQKPiBvbmx5IG9uIHMzOTAgaXMgMjU2IGJ5dGVzLCB3aGlsZSBvbiBv
dGhlciBwcm9jZXNzb3JzIGxlc3MgdGhhbiBvciBlcXVhbAo+IHRvIDEyOCBieXRlcy4gU28gdGhl
IHN1bSBvbiBzMzkwIGlzIG11Y2ggZWFzaWVyIHRvIGV4Y2VlZCB0aGUgbGltaXQsCj4gdGhhdCB0
aGUgYmlnIHBhY2tldCBjYW4gbm90IGJlIHNlbnQgc3VjY2Vzc2Z1bGx5Lgo+IAo+IEJlY2F1c2Ug
b2YgdGhlIGJpZyBjYWNoZSBsaW5lIHNpemUgb24gczM5MCwgdGhlIG1heGltdW0gc2l6ZSBvZiB0
aGUKPiBwYWNrZXQgaXMgbGltaXRlZCBpbiBiZXR3ZWVuIDUzODE2IGFuZCA2NDk2MCwgaWYgdGhl
IE1UVSBpcyBzZXQgdG8KPiBiZXR3ZWVuIDQ4NCBhbmQgNTg4Lgo+IEhvd2V2ZXIsIHRoaXMgcHJv
YmxlbSBub3Qgb25seSBvY2N1cnMgb24gczM5MCwgYnV0IGFsc28gb24gc29tZSBvdGhlcgo+IHBy
b2Nlc3NvciBlLmcuIHg4Ni4gSWYgdGhlIE1UVSBpcyBzZXQgdG8gbGVzcyB0aGFuIDM0MCwgYW4g
SVAgcGFja2V0Cj4gd2l0aCB0aGUgdGhlb3JldGljYWwgbWF4aW11bSBzaXplICg2NTUwNyBieXRl
cykgbGlrZXdpc2UgY2FuIG5vdCBiZSBzZW50Cj4gc3VjY2Vzc2Z1bGx5Lgo+IAo+IE5PVEU6IHRo
ZSBkZXRlY3Rpb24gaXNuJ3QgcHJlY2lzZS4gSSBkaWRuJ3QgY29uc2lkZXIgaXQgaW1wb3J0YW50
IGVub3VnaAo+IHRvIGltcGxlbWVudCBiaXNlY3Rpb24gbWV0aG9kLiBEZXRlY3RlZCBvbmx5IGZv
ciBJUHY0LCBiZWNhdXNlIElQdjYgdXNlcwo+IGhpZ2ggZW5vdWdoIE1UVSAoYW5kIGZ1bmN0aW9u
IGlzIG5vdCBJUHY2IHJlYWR5KS4KPiAKPiBMaW5rOiBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9hYjgyODllNS01NDdjLTUzNzUtNWQwZi1l
OWEzNjMwMDVkYjFAbGludXguaWJtLmNvbS9fXzshIUdxaXZQVmE3QnJpbyFJLURqb2FWQXlZQlI3
dmZ6QmJ2UUM1RFR3WGRVN2tLbjJsa2NwaG9zQUk1UEsyRExLamJBdWFhQmw2WEc2aGgxWWRsaCQg
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Cj4gLS0tCj4g
SGkgQWxleGV5LAo+IAo+IFRoaXMgc2ltcGxlIGNoYW5nZSB3b3VsZCBiZSBlbm91Z2g6Cj4gWyAi
JCh1bmFtZSAtbSkiID0gInMzOTB4IiBdICYmIE1BWF9QQUNLRVRfU0laRT0iNjEyNDQiCj4gCj4g
QnV0IEkgd2FudGVkIHRvIGZpeCB0aGlzIGZvciBhbGwgcGxhdGZvcm1zIGF0IG9uY2UuCj4gCgpI
aSBQZXRyLAoKQW5vdGhlciBvcHRpb24gd291bGQgYmUgdG8gbGltaXQgbWF4IHNpemUgYWNjb3Jk
aW5nIHRvIHRoZSBzaXplIG9mCnRoZSBzZXQgbXR1LCBzbyB0aGF0IHdlIHRlc3QgcGFja2V0cyB3
aXRoIGFuZCB3aXRob3V0IGZyYWdtZW50YXRpb24sCmkuZS4gdHN0X3BpbmcgLXMgIjEgJCgobXR1
IC8gMikpICRtdHUgJCgoNSAqIG10dSkpIiwgd2hlcmUgIiRtdHUiCnNpemUgLSBmb3IgbWlub3Ig
ZnJhZ21lbnRhdGlvbi4KCkFueXdheSB0aGUgcGF0Y2ggbG9va3MgZ29vZCwgbWlub3IgY29tbWVu
dHMgYmVsb3cuCgo+IEtpbmQgcmVnYXJkcywKPiBQZXRyCj4gCj4gIC4uLi9uZXR3b3JrL3N0cmVz
cy9pbnRlcmZhY2UvaWYtbXR1LWNoYW5nZS5zaCB8IDYxICsrKysrKysrKysrKysrLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS90ZXN0Y2FzZXMvbmV0d29yay9zdHJlc3MvaW50ZXJmYWNlL2lmLW10dS1jaGFu
Z2Uuc2ggYi90ZXN0Y2FzZXMvbmV0d29yay9zdHJlc3MvaW50ZXJmYWNlL2lmLW10dS1jaGFuZ2Uu
c2gKPiBpbmRleCBmN2VjMzU2MTkuLmJjMDVlZTE4NyAxMDA3NTUKPiAtLS0gYS90ZXN0Y2FzZXMv
bmV0d29yay9zdHJlc3MvaW50ZXJmYWNlL2lmLW10dS1jaGFuZ2Uuc2gKPiArKysgYi90ZXN0Y2Fz
ZXMvbmV0d29yay9zdHJlc3MvaW50ZXJmYWNlL2lmLW10dS1jaGFuZ2Uuc2gKPiBAQCAtMjEsMTEg
KzIxLDUzIEBAIENIQU5HRV9WQUxVRVM9Ijc4NCAxMTQyIDU1MiAxNTAwIDU1MiAxNTAwIDU1MiA3
NDggNTUyIDExNDIgMTUwMCIKPiAgQ0hBTkdFNl9WQUxVRVM9IjEyODAgMTQ0NSAxMzM1IDEzOTAg
MTUwMCAxMjgwIDE1MDAgMTI4MCAxMzM1IDE1MDAiCj4gIHNhdmVkX210dT0KPiAgCj4gK01BWF9Q
QUNLRVRfU0laRT02NTUwNwo+ICsKPiArc2V0X210dSgpCj4gK3sKPiArCWxvY2FsIG10dT0iJDEi
Cj4gKwlsb2NhbCBjbWQ9IiQyIgo+ICsJbG9jYWwgcmV0PTAKPiArCWxvY2FsIGlmYWNlPSQodHN0
X2lmYWNlKQo+ICsJbG9jYWwgaWZhY2Vfcm10PSQodHN0X2lmYWNlIHJob3N0KQo+ICsKPiArCWNh
c2UgJGNtZCBpbgo+ICsJCWlmY29uZmlnKSBpZmNvbmZpZyAkaWZhY2UgbXR1ICRtdHUgfHwgcmV0
PTEKPiArCQkJdHN0X3Job3N0X3J1biAtYyAiaWZjb25maWcgJGlmYWNlX3JtdCBtdHUgJG10dSIg
fHwgcmV0PTEKPiArCQkJOzsKPiArCQlpcCkgaXAgbGluayBzZXQgJGlmYWNlIG10dSAkbXR1IHx8
IHJldD0xCj4gKwkJCXRzdF9yaG9zdF9ydW4gLWMgImlwIGxpbmsgc2V0ICRpZmFjZV9ybXQgbXR1
ICRtdHUiIHx8IHJldD0xCj4gKwkJCTs7Cj4gKwkJKikgdHN0X2JyayBUQlJPSyAidW5rbm93biBj
bWQgJyRjbWQnIgo+ICsJCQk7Owo+ICsJZXNhYwo+ICsKPiArCXJldHVybiAkcmV0Cj4gK30KPiAr
Cj4gK2ZpbmRfaXB2NF9tYXhfcGFja2V0X3NpemUoKQo+ICt7Cj4gKwlsb2NhbCBtaW5fbXR1PTU1
Mgo+ICsJbG9jYWwgc2l6ZT0kTUFYX1BBQ0tFVF9TSVpFCj4gKwo+ICsJc2V0X210dSAkbWluX210
dSAkQ01EIHx8IHRzdF9icmsgVEJST0sgImZhaWxlZCB0byBzZXQgTVRVIHRvICRtdHUiCj4gKwl0
c3RfcmVzIFRJTkZPICJjaGVja2luZyBtYXggTVRVIgo+ICsJd2hpbGUgWyAkc2l6ZSAtZ3QgMCBd
OyBkbwo+ICsJCWlmIHBpbmcgLUkgJCh0c3RfaWZhY2UpIC1jMSAtdzEgLXMgJHNpemUgJCh0c3Rf
aXBhZGRyIHJob3N0KSA+L2Rldi9udWxsOyB0aGVuCj4gKwkJCXRzdF9yZXMgVElORk8gInVzZSBt
YXggTVRVICRzaXplIgo+ICsJCQlNQVhfUEFDS0VUX1NJWkU9JHNpemUKPiArCQkJcmV0dXJuCj4g
KwkJZmkKPiArCQlzaXplPSQoKHNpemUgLSA1MDApKQo+ICsJZG9uZQoKU2hvdWxkIHdlIFRCUk9L
IGhlcmU/Cgo+ICt9Cj4gKwo+ICBkb19zZXR1cCgpCj4gIHsKPiAgCVsgIiRUU1RfSVBWNiIgXSAm
JiBDSEFOR0VfVkFMVUVTPSRDSEFOR0U2X1ZBTFVFUwo+ICAJaWZfc2V0dXAKPiAgCXNhdmVkX210
dT0iJChjYXQgL3N5cy9jbGFzcy9uZXQvJCh0c3RfaWZhY2UpL210dSkiCj4gKwlbICIkVFNUX0lQ
VjYiIF0gfHwgZmluZF9pcHY0X21heF9wYWNrZXRfc2l6ZQo+ICB9Cj4gIAo+ICBkb19jbGVhbnVw
KCkKPiBAQCAtNDEsOSArODMsNiBAQCB0ZXN0X2JvZHkoKQo+ICB7Cj4gIAlsb2NhbCBjbWQ9IiRD
TUQiCj4gIAo+IC0JbG9jYWwgaWZhY2U9JCh0c3RfaWZhY2UpCj4gLQlsb2NhbCBpZmFjZV9ybXQ9
JCh0c3RfaWZhY2Ugcmhvc3QpCj4gLQo+ICAJdHN0X3JlcyBUSU5GTyAiJyRjbWQnIGNoYW5nZXMg
TVRVICRNVFVfQ0hBTkdFX1RJTUVTIHRpbWVzIiBcCj4gIAkgICAgICAgICAgICAgICAiZXZlcnkg
JENIQU5HRV9JTlRFUlZBTCBzZWNvbmRzIgo+ICAKPiBAQCAtNTksMjQgKzk4LDE0IEBAIHRlc3Rf
Ym9keSgpCj4gIAkJbWFrZV9iYWNrZ3JvdW5kX3RjcF90cmFmZmljCj4gIAo+ICAJCXRzdF9yZXMg
VElORk8gInNldCBNVFUgdG8gJG10dSAkY250LyRNVFVfQ0hBTkdFX1RJTUVTIgo+IC0JCWxvY2Fs
IHJldD0wCj4gLQkJY2FzZSAkY21kIGluCj4gLQkJaWZjb25maWcpIGlmY29uZmlnICRpZmFjZSBt
dHUgJG10dSB8fCByZXQ9MQo+IC0JCQl0c3Rfcmhvc3RfcnVuIC1jICJpZmNvbmZpZyAkaWZhY2Vf
cm10IG10dSAkbXR1Igo+IC0JCTs7Cj4gLQkJaXApIGlwIGxpbmsgc2V0ICRpZmFjZSBtdHUgJG10
dSB8fCByZXQ9MQo+IC0JCQl0c3Rfcmhvc3RfcnVuIC1jICJpcCBsaW5rIHNldCAkaWZhY2Vfcm10
IG10dSAkbXR1Igo+IC0JCTs7Cj4gLQkJZXNhYwo+IC0KPiAtCQlpZiBbICQ/IC1uZSAwIC1vICRy
ZXQgLW5lIDAgXTsgdGhlbgo+IC0JCQl0c3RfcmVzIFRGQUlMICJGYWlsZWQgdG8gY2hhbmdlIHRo
ZSBtdHUgYXQgJGNudCB0aW1lIgo+ICsJCWlmICEgc2V0X210dSAkbXR1ICRjbWQ7IHRoZW4KPiAr
CQkJdHN0X3JlcyBURkFJTCAiZmFpbGVkIHRvIGNoYW5nZSBNVFUgdG8gJG10dSBhdCAkY250IHRp
bWUiCj4gIAkJCXJldHVybgo+ICAJCWZpCj4gIAo+ICAJCXRzdF9zbGVlcCAkQ0hBTkdFX0lOVEVS
VkFMCj4gIAo+IC0JCXRzdF9waW5nIC1zICIxIDEwMDAgNjU1MDciCj4gKwkJdHN0X3BpbmcgLXMg
IjEgMTAwMCAkTUFYX1BBQ0tFVF9TSVpFIgoKdHN0X3BpbmcgLXMgIjEgJCgobXR1IC8gMikpICRt
dHUgJE1BWF9QQUNLRVRfU0laRSI/CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
