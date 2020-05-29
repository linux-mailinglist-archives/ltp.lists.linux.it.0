Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 356661E7B33
	for <lists+linux-ltp@lfdr.de>; Fri, 29 May 2020 13:05:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE72E3C3189
	for <lists+linux-ltp@lfdr.de>; Fri, 29 May 2020 13:05:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 65FB93C3175
 for <ltp@lists.linux.it>; Fri, 29 May 2020 13:05:56 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BB40A140B562
 for <ltp@lists.linux.it>; Fri, 29 May 2020 13:05:55 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04TB1pVn182752;
 Fri, 29 May 2020 11:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=O6wkOFJ+FUoe+zTCKAinIxQi5jp6h9LsFVXKAU/YtUI=;
 b=A3E2dirvCMW64Et10GkFkpmrgfZiKpN/ZRvt3Ma1uMhm9hCkutcf9EgEyOelvPVetZpQ
 2T0LCoi21QssW+GbFRtgt5y2NSmbygEUt8lsgPjCoAjnUg65PwAD0BcPwr2Q+3i/GFa7
 ppDsvsUbwUR0FjgT8NfcxBk47zWX2rS7nSvAbU+CuR5PJiInA92n+Mk64sIiPgufZQVP
 m41ri4+9BtQmJPxGuS3d0azRzx79+MMIZE7/lKoFtJo/9zs1CKw2zQCp1ozp0GXotlUf
 uVCet5cdhD0oKqAgArFq6qAyTVKft24mV53keYY0IutVFwPuM4UYExkkso2aajUUuHrs zA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 318xbk9tsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 29 May 2020 11:05:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04TAx0bS046649;
 Fri, 29 May 2020 11:05:53 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 317ds44vm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 May 2020 11:05:53 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04TB5oXh009149;
 Fri, 29 May 2020 11:05:52 GMT
Received: from [10.175.59.138] (/10.175.59.138)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 29 May 2020 04:05:50 -0700
To: Jan Stancek <jstancek@redhat.com>
References: <20200526113847.6837-1-stanislav.kholmanskikh@oracle.com>
 <1158333456.13771112.1590570252412.JavaMail.zimbra@redhat.com>
From: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
Message-ID: <fa945f1f-f1ea-ab6c-f70c-6bee9a99db64@oracle.com>
Date: Fri, 29 May 2020 14:05:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1158333456.13771112.1590570252412.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9635
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290088
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9635
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 cotscore=-2147483648
 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005290088
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] acct02: fix the ac_version check on big endian
 platforms
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhhbmsgeW91LiBDb21taXR0ZWQuCgpPbiAyNy4wNS4yMDIwIDEyOjA0LCBKYW4gU3RhbmNlayB3
cm90ZToKPiAKPiAKPiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4+IElmIHdlIGFyZSBv
biBhIGJpZyBlbmRpYW4gcGxhdGZvcm0gd2hlcmUgY2hhciBpcyBzaWduZWQsCj4+IHRoZSBmb2xs
b3dpbmcgY29tcGlsYXRpb24gZXJyb3IgaXMgZW1pdHRlZDoKPj4KPj4gYWNjdDAyLmM6IEluIGZ1
bmN0aW9uIOKAmHZlcmlmeV9hY2N04oCZOgo+PiBhY2N0MDIuYzozODozNzogd2FybmluZzogY29t
cGFyaXNvbiBpcyBhbHdheXMgdHJ1ZSBkdWUgdG8gbGltaXRlZCByYW5nZSBvZgo+PiBkYXRhIHR5
cGUgWy1XdHlwZS1saW1pdHNdCj4+ICAgI2RlZmluZSBBQ0NUX01FTUJFUl9WMyh4KSAoKChzdHJ1
Y3QgYWNjdF92MyAqKWFjYyktPngpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXgo+PiBhY2N0MDIuYzoxNDQ6Njogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKA
mEFDQ1RfTUVNQkVSX1Yz4oCZCj4+ICAgIGlmIChBQ0NUX01FTUJFUl9WMyhhY192ZXJzaW9uKSAh
PSAoMyB8IEFDQ1RfQllURU9SREVSKSkgewo+Pgo+PiBhbmQgdGhlIHRlc3QgY2FzZSBmYWlscywg
YmVjYXVzZSBpdCBjYW5ub3QgJ2RlY3J5cHQnIHRoZSBhY192ZXJzaW9uCj4+IGZyb20gdGhlIGZp
bGU6Cj4+Cj4+IGFjY3QwMi5jOjIzODogSU5GTzogVmVyaWZ5aW5nIHVzaW5nICdzdHJ1Y3QgYWNj
dF92MycKPj4gYWNjdDAyLmM6MTkxOiBJTkZPOiA9PSBlbnRyeSAxID09Cj4+IGFjY3QwMi5jOjE0
NjogSU5GTzogYWNfdmVyc2lvbiAhPSAzICgtMTI1KQo+Pgo+PiBPbmUgd2F5IHRvIGFkZHJlc3Mg
dGhhdCBpcyB0byBleHBsaWNpdGx5IGNhc3QgdGhlIGV4cHJlc3Npb24KPj4gd2UgY29tcGFyZSB0
byAod2hpY2ggaXMgaW50KSB0byB0aGUgdHlwZSBvZiBhY192ZXJzaW9uICh3aGljaCBpcyBjaGFy
KS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU3RhbmlzbGF2IEtob2xtYW5za2lraCA8c3RhbmlzbGF2
Lmtob2xtYW5za2lraEBvcmFjbGUuY29tPgo+IAo+IEFja2VkLWJ5OiBKYW4gU3RhbmNlayA8anN0
YW5jZWtAcmVkaGF0LmNvbT4KPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
