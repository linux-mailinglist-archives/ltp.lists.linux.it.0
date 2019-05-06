Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C28D14BD6
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 16:32:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2A293EAE76
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 16:32:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 964203EA0B7
 for <ltp@lists.linux.it>; Mon,  6 May 2019 16:32:31 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B5B5D601C6D
 for <ltp@lists.linux.it>; Mon,  6 May 2019 16:32:30 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46ETN4I071748;
 Mon, 6 May 2019 14:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=yDMn3/oO9QZ5Cp3a7ty9iiUn0Spf1241bYt+GAtSMZQ=;
 b=5BgQ7ut8PRa0ZpYZpfABHpMBzAu3sdEunCU4kSIveNu+BDHzyQCYKzH8y8ssSKgUBjkQ
 Wa0W8JYb4yz6BcuBFr+k6zza/e5m3mQikOgiqA5GdNVgmdpxbAtM1bQLfWUFeA6wUFo+
 /QzYXavJbXKAf9b9QRHP9NG01YkYHppBgPPWXApCBlGhBSFRoYr/p+EY7UplNHc6hix3
 LBYlLaZBcQJeqERsO5XTXpQsTOlYS3c7ZpH6zGlfKoSSzkz62zUCYI5/oX+0w0dekjcX
 NNPkoJuU28jkBAATG78dF2MWeNXI3CEuoKw/ifY3BJ53As/rQR38ozNHj4pW4lUQDtav dA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2s94b0ey5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 May 2019 14:32:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46EVFiS113979;
 Mon, 6 May 2019 14:32:26 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2s94aexbuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 May 2019 14:32:26 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x46EWMTu001429;
 Mon, 6 May 2019 14:32:26 GMT
Received: from [192.168.1.111] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 06 May 2019 07:32:22 -0700
To: Petr Vorel <pvorel@suse.cz>
References: <20190427053929.7372-1-pvorel@suse.cz>
 <5cff91e0-c566-27c3-95dd-39dd4e2b6d0e@oracle.com>
 <20190502114459.GA32460@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <0c7a3010-d7d6-1d83-0548-148adb55b2cc@oracle.com>
Date: Mon, 6 May 2019 17:32:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190502114459.GA32460@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9248
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=998
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060125
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9248
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905060125
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
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

SGkgUGV0ciwKT24gMDIuMDUuMjAxOSAxNDo0NCwgUGV0ciBWb3JlbCB3cm90ZToKPiBIaSBBbGV4
ZXksCj4gCj4+IEFja2VkLWJ5OiBBbGV4ZXkgS29kYW5ldiA8YWxleGV5LmtvZGFuZXZAb3JhY2xl
LmNvbT4KPiAuLi4KPj4+ICtleHBvcnQgSUNNUFY0X0RBVEFfTUFYU0laRT0xNDcyCj4+PiArZXhw
b3J0IElDTVBWNl9EQVRBX01BWFNJWkU9MTQ1Mgo+IAo+PiBTaW5jZSB0aGVzZSB2YXJpYWJsZXMg
YXJlIGluIHRoZSBsaWJyYXJ5LCBtYXkgYmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIHR1bmUKPj4g
dGhlbSBkZXBlbmRpbmcgb24gYW4gTVRVIG9mIHRoZSB0ZXN0cyBpbnRlcmZhY2VzPwo+IEdvb2Qg
aWRlYS4gMTQ3MiBhbmQgMTQ1MiBhcmUgYmFzZWQgb24gTVRVID0gMTUwMCAoSVB2NDogMTUwMCAt
IDIwIGJ5dGVzIGZvciBJUHY0IGhlYWRlcgo+IC0gOCBieXRlcyBmb3IgSUNNUCBoZWFkZXI7IElQ
djY6IDE1MDAgLSA0MCBieXRlcyBmb3IgSVB2NiBoZWFkZXIgLSA4IGJ5dGVzIGZvciBJQ01QIGhl
YWRlciksCj4gd2hpY2ggbG9va3MgdG8gbWUgYXMgdGhlIGRlZmF1bHQgZm9yIG5ldG5zIE5JQ3Mg
YW5kIGV0aGVybmV0IGFuZCB3aWZpIE5JQ3MsCj4gYnV0IHdlIHNob3VsZCBhdm9pZCBmYWlsdXJl
cyB3aGVuIGRpZmZlcmVudCBNVFUgdXNlZC4KPiBJIHByb3Bvc2UgbWVyZ2luZyB0aGlzIHZlcnNp
b24gYW5kIGFkZCBNVFUgZGV0ZWN0aW9uIHN1cHBvcnQgbGF0ZXIuCj4gCgpPSy4gUGVyaGFwcyB3
ZSBzaG91bGQgcmVuYW1lIHRoZW0gdG8gaW5kaWNhdGUgdGhhdCB0aGV5IHJlbGF0ZSB0byBucy1p
Y21wdl9zZW5kZXIsCmJlY2F1c2UgdGhlIG1heGltdW0gaWNtcCBkYXRhIHNpemUgaXMgNjU1MzUg
LSBoZWFkZXJzLCBub3QgdGhvc2UgdmFsdWVzLgoKCj4gSSBndWVzcyB3ZSBkb24ndCBuZWVkIHRv
IGNoZWNrIC1zIHZhbHVlcyBwYXNzZWQgdG8gdHN0X2ljbXAoKSAoSSBndWVzcyBub2JvZHkKPiBz
ZXQgTVRVIDwgMTAwMCwgYWx0aG91Z2ggaXQncyBub3QgZm9yYmlkZGVuIGZvciBJUHY0KS4gQnV0
IEknZCBhZGQgdGhpcyBjaGVjawo+IGFsc28gaW50byBucy1pY21wdls0Nl1fc2VuZGVyLmMuCj4g
Cj4gKyBvZmYgY291cnNlIG90aGVyIGNsZWFudXAgbGlrZSBtZXJnaW5nIG5zLWljbXB2WzQ2XV9z
ZW5kZXIuYyBpbnRvIHNpbmdsZSBjb2RlIHdvdWxkIGJlIG5pY2UsCj4gYnV0IGZpcnN0IEkgd2Fu
dCB0byBmaW5pc2ggcm91dGUgcmV3cml0aW5nLgo+IAo+PiBBbHNvIHdlIGNhbiBzZW5kIG1vcmUg
d2l0aCBmcmFnbWVudGF0aW9uLCBidXQgSSBndWVzcyBucy1pY21wdiBkb2Vzbid0Cj4+IGhhdmUg
cHJvcGVyIHN1cHBvcnQuLi4KPiBEbyB5b3UgbWVhbiB0byBzZW5kIHBhY2tldCBiaWcgZW5vdWdo
IHRvIGhhdmUgZnJhZ21lbnRhdGlvbiBvbiBsaG9zdD8KPiArIHNldHNvY2tvcHQgSVBfUE1UVURJ
U0NfRE9OVD8KPiAKPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+IAoKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
