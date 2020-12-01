Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBF82C9F35
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 11:33:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 960B13C5924
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 11:33:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D8B753C2BF6
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 11:32:56 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 02E49200AE9
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 11:32:55 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1ATF3i180177;
 Tue, 1 Dec 2020 10:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=YnPgFfL58fUEphriupS4qBxGTvgey9HoKFj2caAdaSA=;
 b=ZACVgB10nYoV6bEmQKkogLlXigHADekxXxZdyFPkr3zDh2ID8Rfd1jv5ZHJrWUVU9+MB
 3zias0IwgysZN+CUmnnFrkQOe7X5suf6q7zX0C92jIgPq79pD+GQ04TnCvMXq/cCMdir
 5lO7C+Mk4g9Zm9q+r9VVsqv5UJC4Tg/MITh8Xowj+MVTrn2RFdmjrqOOctoozt0FCNuU
 tYZM8JYzZmt2e1cykaZ6q6NEnyuOw4Fo2IQ2eRhc9XoOQ7uFoiMnqMActKUoQ+TvyDpE
 TfT1EGkOvjcl2ni3sVr2BoiEsE/rY0V8JjPsOM8W0+8HF/3DMMELDU4o8B7vFq22gQP7 7A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 353dyqhu08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 10:32:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1AUGAd077582;
 Tue, 1 Dec 2020 10:32:48 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 3540as3x1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Dec 2020 10:32:48 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B1AWi47017280;
 Tue, 1 Dec 2020 10:32:45 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Dec 2020 02:32:44 -0800
To: =?UTF-8?Q?K=c3=b6ry_Maincent?= <kory.maincent@bootlin.com>,
 ltp@lists.linux.it
References: <20201130203324.613c1b08@kmaincent-XPS-13-7390>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <faa8352f-7ec0-4fa6-8d5d-4fd4c1366f9f@oracle.com>
Date: Tue, 1 Dec 2020 13:32:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130203324.613c1b08@kmaincent-XPS-13-7390>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010068
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010068
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] Make FTP test compatible with Busybox and Dropbear.
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

T24gMzAuMTEuMjAyMCAyMjozMywgS8O2cnkgTWFpbmNlbnQgd3JvdGU6Cj4gSGVsbG8sCj4gCgpI
aSBLb3J5LAoKPiBJIGFtIHdvcmtpbmcgd2l0aCBMVFAgb24gYW4gZW1iZWRkZWQgYm9hcmQuCj4g
SSB3b3VsZCBsaWtlIHRvIG5vdGljZSB0aGUgcmhvc3RfcnVuIGNvbW1hbmQgZG9lcyBub3Qgd29y
ayB3aXRoIERyb3BiZWFyIHNzaAo+IGNsaWVudC4gSSBhbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCBo
b3cgdHN0X25ldCB3b3JrIGJ1dCBJIGFtIGEgYml0IHN0cnVnZ2xpbmcKPiB3aXRoIGl0LiBXaGF0
IGlzIHRoZSB1c2FnZSBvZiBUU1RfVVNFX05FVE5TLCBhbmQgdGhlIHB1cnBvc2Ugb2YgbmV0c3Bh
Y2UgKGl0Cj4gc2VlbXMgdG8gYmUgdXNlZCB0byBjb25maWd1cmUgYSB2aXJ0dWFsIGludGVyZmFj
ZSk/Cj4gTXkgYWltIHdhcyB0byBtYWtlIEZUUCB0ZXN0IHdvcmsgd2l0aCBEcm9wYmVhciBhbmQg
QnVzeWJveC4gSWYgc29tZW9uZSBjb3VsZAo+IHBvaW50IG1lIG91dCBob3cgdG8gZG8gaXQuCj4g
Cgpzc2ggaXMgdXNlZCBmb3IgdHdvIGhvc3Qgc2V0dXAgb25seSwgaWYgeW91IGFyZSBydW5uaW5n
IG9uIGEgc2luZ2xlCm1hY2hpbmUsIGl0J3Mgbm90IHVzZWQgYXQgYWxsLiBJbnN0ZWFkIHRzdF9y
aG9zdF9ydW4oKSBydW5zIHRoZSBjb21tYW5kCmluIHRoZSBkaWZmZXJlbnQgbmFtZXNwYWNlIChs
dHBfbnMpLCBhbmQgaXQgaXMgdGhlIGRlZmF1bHQgc2V0dXAuIEFsc28sIGJ5CmRlZmF1bHQsIHRz
dF9uZXQuc2ggY3JlYXRlcyB2ZXRoIHBhaXIgdG8gY29ubmVjdCB0byBsdHBfbnMgYW5kIHJ1biBu
ZXR3b3JrCnRlc3RzIG92ZXIgaXQuCgpNb3Jlb3ZlciBzdWNoIHNldHVwIGNhbiBiZSByZXBsYWNl
ZCB2aWEgUkhPU1QgZW52aXJvbm1lbnQgdmFyaWFibGUgKHR3bwpob3N0IHNldHVwICsgdXNpbmcg
c3NoKSBhbmQgc3NoIGJlY29tZXMgdGhlIG1hbmFnZW1lbnQgbGluaywgb3IgY3VzdG9tCm5ldHdv
cmsgbmFtZXNwYWNlIHZpYSBMVFBfTkVUTlMgdmFyLiBUZXN0IG5ldHdvcmsgcGFyYW1ldGVycyBy
ZXBsYWNlZAp2aWEgSVBWNHs2fV9MSE9TVC9JUFY0ezZ9X1JIT1NUIHZhcnMuCgoKPiBSZWdhcmRz
LAo+IAo+IEvDtnJ5Cj4gCj4gCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
