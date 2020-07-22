Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CDE22994F
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 15:40:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C50673C4D9F
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 15:40:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1472D3C266A
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 15:40:17 +0200 (CEST)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E1B43200DA8
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 15:40:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Mime-Version:Message-ID:Subject:Date:From; bh=s6c64
 BIB09bZCHSgZhRoH09HV1I9RyBznu5bJ9sw3sQ=; b=FZZZnv+MY5E4aBmRb3HsJ
 yXd4NCzk4faN+CWZ9I9QMWNxveFRLILz6oHhvvtEu7QV2oUkqgH94y8/x1C6Hj3g
 BrYkJdc2vH+rt/9EUrrBb+itqRcMItzWejK+UiXfHlZFemrBBlHw0CTGpgkZA8Rg
 Gpc+a/KIOH6iIWqcdDgji8=
Received: from localhost (unknown [223.104.145.80])
 by smtp8 (Coremail) with SMTP id DMCowACnqwu4QRhf4bMyFQ--.14600S2;
 Wed, 22 Jul 2020 21:40:09 +0800 (CST)
Mime-Version: 1.0
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Message-ID: 
Date: Wed, 22 Jul 2020 21:40:07 +0800 (GMT+08:00)
From: =?UTF-8?B?eHV5YW5nX2p5XzA0MTBAMTYzLmNvbQ==?=<xuyang_jy_0410@163.com>
To: =?UTF-8?B?Q3lyaWwgSHJ1Ymlz?=<chrubis@suse.cz>,
 =?UTF-8?B?WWFuZyBYdQ==?=<xuyang2018.jy@cn.fujitsu.com>
X-CM-TRANSID: DMCowACnqwu4QRhf4bMyFQ--.14600S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF45Jw48WF15Xw1xXrWxXrb_yoW8tw48pF
 WrXFWUGr4DKr42vryxZw1SgFnFvF18Aws8Jr43urWUGw1fAryS93s8K3yFqw4FvrZ3Wa4D
 XFy8WrWxA3yDZF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5PEfUUUUU=
X-Originating-IP: [223.104.145.80]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiGhpphFaD6tcddQAAst
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=4.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_EXCESS_BASE64,
 FROM_MISSP_FREEMAIL,HTML_MESSAGE,MIME_BASE64_TEXT,MIME_HTML_MOSTLY,
 MPART_ALT_DIFF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/ioctl_loop06: Using
 LOOP_CONFIGURE to test invalid block size
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
Cc: =?UTF-8?B??= <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1209603114=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1209603114==
Content-Type: multipart/alternative; 
	boundary="----=_Part_0_243795517.1595425208453"

------=_Part_0_243795517.1595425208453
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: base64


------=_Part_0_243795517.1595425208453
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5ISTwvZGl2PjxkaXY+QWdyZWUsIGJ1dCBJIHRoaW5rIHdlIGNhbiBtZXJnZSB0aGlzIHBh
dGNoIGZpcnN0bHkuIEFuZCBJIHdpbGwgc2VuZCBhIHBhdGNoc2V0IGZvciB0aGlzIGFwaSZuYnNw
OyB0b21vcnJvdyBiZWNhdXNlIG90aGVyIGNhc2UgbGlrZSBpb2N0bDA5IGlvY3RsX2xvb3AwMSBh
bHNvIGNhbiB1c2UgdGhpcyBhcGkuJm5ic3A7IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IHRoaXPv
vJ88L2Rpdj48ZGl2PkJlc3QgUmVnYXJkczwvZGl2PjxkaXY+WWFuZyBYdTwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+PCEtLWVtcHR5c2lnbi0tPjwvZGl2PjxkaXY+PGRpdiBzdHlsZT0iZm9udC1z
aXplOjEycHg7cGFkZGluZzoycHggMDsiPi0tLU9yaWdpbmFsLS0tPC9kaXY+PGRpdiBzdHlsZT0i
Zm9udC1zaXplOjEycHg7YmFja2dyb3VuZDojZjBmMGYwO2NvbG9yOiMyMTIxMjE7cGFkZGluZzo4
cHghaW1wb3J0YW50O2JvcmRlci1yYWRpdXM6NHB4O2xpbmUtaGVpZ2h0OjEuNTsiPjxkaXY+PGI+
RnJvbTo8L2I+ICJDeXJpbCBIcnViaXMiJmx0O2NocnViaXNAc3VzZS5jeiZndDs8L2Rpdj48ZGl2
PjxiPkRhdGU6PC9iPiBXZWQsIEp1bCAyMiwgMjAyMCAyMDo1OSBQTTwvZGl2PjxkaXY+PGI+VG86
PC9iPiAiWWFuZyBYdSImbHQ7eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbSZndDs7PC9kaXY+
PGRpdj48Yj5DYzo8L2I+ICJsdHAiJmx0O2x0cEBsaXN0cy5saW51eC5pdCZndDs7PC9kaXY+PGRp
dj48Yj5TdWJqZWN0OjwvYj4gUmU6IFtMVFBdIFtQQVRDSCB2MiAxLzJdIHN5c2NhbGxzL2lvY3Rs
X2xvb3AwNjogVXNpbmcgTE9PUF9DT05GSUdVUkUgdG8gdGVzdCBpbnZhbGlkIGJsb2NrIHNpemU8
L2Rpdj48L2Rpdj48YnI+SGkhPGJyPiZndDsmbmJzcDsmZ3Q7Jm5ic3A7RG8mbmJzcDt3ZSZuYnNw
O3JlYWxseSZuYnNwO25lZWQmbmJzcDt0byZuYnNwO2Nsb3NlJm5ic3A7YW5kJm5ic3A7b3BlbiZu
YnNwO3RoZSZuYnNwO2Rldl9mZCZuYnNwO3JlcGVhdGVkbHkmbmJzcDthbmQmbmJzcDthbHNvJm5i
c3A7d2U8YnI+Jmd0OyZuYnNwOyZndDsmbmJzcDtkb24ndCZuYnNwO2hhdmUmbmJzcDt0byZuYnNw
O2F0dGFjaCZuYnNwO3RoZSZuYnNwO2RldmljZSZuYnNwO2luJm5ic3A7dGhlJm5ic3A7dGVzdCZu
YnNwO3NldHVwPzxicj4mZ3Q7Jm5ic3A7WUVTLCZuYnNwO3dlJm5ic3A7ZG9uJ3QmbmJzcDtuZWVk
Jm5ic3A7dG8mbmJzcDthdHRhY2gmbmJzcDt0aGUmbmJzcDtkZXZpY2UmbmJzcDtpbiZuYnNwO3Ro
ZSZuYnNwO3NldHVwJm5ic3A7YmVjYXVzZSZuYnNwOzxicj4mZ3Q7Jm5ic3A7TE9PUF9TRVRfQkxP
Q0tfU0laRSZuYnNwO2NoZWNrcyZuYnNwO3dvcmtzJm5ic3A7d2VsbChyZXR1cm4mbmJzcDtFTlhJ
TyZuYnNwO2lmJm5ic3A7c3VwcG9ydHMsJm5ic3A7cmV0dXJuJm5ic3A7PGJyPiZndDsmbmJzcDtF
SU5WQUwmbmJzcDtpZiZuYnNwO25vdCZuYnNwO3N1cHBvcnRzKSZuYnNwO3doZW4mbmJzcDtub3Qm
bmJzcDthdHRhY2hpbmcmbmJzcDtkZXZpY2UuPGJyPiZndDsmbmJzcDs8YnI+Jmd0OyZuYnNwO0J1
dCZuYnNwO2ZvciZuYnNwO2Nsb3NlJm5ic3A7YW5kJm5ic3A7b3BlbiZuYnNwO3RoZSZuYnNwO2Rl
dl9mZCZuYnNwO3JlcGVhdGVkbHksJm5ic3A7SSZuYnNwO3RoaW5rJm5ic3A7aXQmbmJzcDtpcyZu
YnNwO25lY2Vzc2FyeSZuYnNwOzxicj4mZ3Q7Jm5ic3A7YmVjYXVzZSZuYnNwO3doZW4mbmJzcDt3
ZSZuYnNwO2RldGFjaCZuYnNwO2RldmljZSZuYnNwO2ZpcnN0bHkmbmJzcDt3aXRob3V0Jm5ic3A7
Y2xvc2luZyZuYnNwO2RldiZuYnNwO2ZkLCZuYnNwO2l0Jm5ic3A7d2lsbCZuYnNwOzxicj4mZ3Q7
Jm5ic3A7cmVwb3J0Jm5ic3A7dGhlJm5ic3A7d2FybmdpbmcmbmJzcDthcyZuYnNwO2JlbG93Ojxi
cj4mZ3Q7Jm5ic3A7PGJyPiZndDsmbmJzcDt0c3RfZGV2aWNlLmM6ODk6Jm5ic3A7SU5GTzombmJz
cDtGb3VuZCZuYnNwO2ZyZWUmbmJzcDtkZXZpY2UmbmJzcDswJm5ic3A7Jy9kZXYvbG9vcDAnPGJy
PiZndDsmbmJzcDtpb2N0bF9sb29wMDYuYzo2OTombmJzcDtJTkZPOiZuYnNwO1VzaW5nJm5ic3A7
TE9PUF9TRVRfQkxPQ0tfU0laRSZuYnNwO3dpdGgmbmJzcDthcmcmbmJzcDsmbHQ7Jm5ic3A7NTEy
PGJyPiZndDsmbmJzcDtpb2N0bF9sb29wMDYuYzo2MDombmJzcDtQQVNTOiZuYnNwO1NldCZuYnNw
O2Jsb2NrJm5ic3A7c2l6ZSZuYnNwO2ZhaWxlZCZuYnNwO2FzJm5ic3A7ZXhwZWN0ZWQ6Jm5ic3A7
RUlOVkFMJm5ic3A7KDIyKTxicj4mZ3Q7Jm5ic3A7aW9jdGxfbG9vcDA2LmM6Njk6Jm5ic3A7SU5G
TzombmJzcDtVc2luZyZuYnNwO0xPT1BfU0VUX0JMT0NLX1NJWkUmbmJzcDt3aXRoJm5ic3A7YXJn
Jm5ic3A7Jmd0OyZuYnNwO1BBR0VfU0laRTxicj4mZ3Q7Jm5ic3A7aW9jdGxfbG9vcDA2LmM6NjA6
Jm5ic3A7UEFTUzombmJzcDtTZXQmbmJzcDtibG9jayZuYnNwO3NpemUmbmJzcDtmYWlsZWQmbmJz
cDthcyZuYnNwO2V4cGVjdGVkOiZuYnNwO0VJTlZBTCZuYnNwOygyMik8YnI+Jmd0OyZuYnNwO2lv
Y3RsX2xvb3AwNi5jOjY5OiZuYnNwO0lORk86Jm5ic3A7VXNpbmcmbmJzcDtMT09QX1NFVF9CTE9D
S19TSVpFJm5ic3A7d2l0aCZuYnNwO2FyZyZuYnNwOyE9Jm5ic3A7cG93ZXJfb2ZfMjxicj4mZ3Q7
Jm5ic3A7aW9jdGxfbG9vcDA2LmM6NjA6Jm5ic3A7UEFTUzombmJzcDtTZXQmbmJzcDtibG9jayZu
YnNwO3NpemUmbmJzcDtmYWlsZWQmbmJzcDthcyZuYnNwO2V4cGVjdGVkOiZuYnNwO0VJTlZBTCZu
YnNwOygyMik8YnI+Jmd0OyZuYnNwO2lvY3RsX2xvb3AwNi5jOjY5OiZuYnNwO0lORk86Jm5ic3A7
VXNpbmcmbmJzcDtMT09QX0NPTkZJR1VSRSZuYnNwO3dpdGgmbmJzcDtibG9ja19zaXplJm5ic3A7
Jmx0OyZuYnNwOzUxMjxicj4mZ3Q7Jm5ic3A7dHN0X2RldmljZS5jOjIyMzombmJzcDtXQVJOOiZu
YnNwO2lvY3RsKC9kZXYvbG9vcDAsJm5ic3A7TE9PUF9DTFJfRkQsJm5ic3A7MCkmbmJzcDtubyZu
YnNwO0VOWElPJm5ic3A7Zm9yJm5ic3A7PGJyPiZndDsmbmJzcDt0b28mbmJzcDtsb25nPGJyPiZn
dDsmbmJzcDtpb2N0bF9sb29wMDYuYzo2MjombmJzcDtGQUlMOiZuYnNwO1NldCZuYnNwO2Jsb2Nr
Jm5ic3A7c2l6ZSZuYnNwO2ZhaWxlZCZuYnNwO2V4cGVjdGVkJm5ic3A7RUlOVkFMJm5ic3A7Z290
OiZuYnNwOzxicj4mZ3Q7Jm5ic3A7RUJVU1kmbmJzcDsoMTYpPGJyPiZndDsmbmJzcDs8YnI+Jmd0
OyZuYnNwO1RoYXQmbmJzcDtpcyZuYnNwO3doeSZuYnNwO0kmbmJzcDtjbG9zZSZuYnNwO2Rldl9m
ZCZuYnNwO2ZpcnN0bHkmbmJzcDthbmQmbmJzcDt0aGVuJm5ic3A7ZGV0YWNoJm5ic3A7ZGV2aWNl
Jm5ic3A7aW4mbmJzcDtjbGVhbnVwJm5ic3A7PGJyPiZndDsmbmJzcDtmdW5jdGlvbi48YnI+PGJy
PkFoLCZuYnNwO3JpZ2h0LCZuYnNwO3RoZSZuYnNwO3RzdF9kZXRhY2hfZGV2aWNlKCkmbmJzcDtv
cGVucyZuYnNwO3RoZSZuYnNwO2Rldl9wYXRoJm5ic3A7c28mbmJzcDt0aGUmbmJzcDtmdW5jdGlv
bjxicj5mYWlscyZuYnNwO3RvJm5ic3A7ZGVzdHJveSZuYnNwO2l0Jm5ic3A7YmVjYXVzZSZuYnNw
O3RoZSZuYnNwO2RldmljZSZuYnNwO2lzJm5ic3A7b3BlbmVkJm5ic3A7dHdpY2UmbmJzcDthdCZu
YnNwO3RoYXQmbmJzcDtwb2ludC48YnI+PGJyPkkmbmJzcDtndWVzcyZuYnNwO3RoYXQmbmJzcDtw
cm9wZXImbmJzcDtzb2x1dGlvbiZuYnNwO3dvdWxkJm5ic3A7YmUmbmJzcDt0byZuYnNwO2FkZCZu
YnNwO2EmbmJzcDt0c3RfZGV0YWNoX2RldmljZV9ieV9mZCgpPGJyPmFuZCZuYnNwO2NoYW5nZSZu
YnNwO3RoZSZuYnNwO2xpYnJhcnkmbmJzcDtzbyZuYnNwO3RoYXQmbmJzcDt0c3RfZGV0YWNoX2Rl
dmljZSgpJm5ic3A7b3BlbnMmbmJzcDt0aGUmbmJzcDtkZXZfcGF0aDxicj5hbmQmbmJzcDtjYWxs
cyZuYnNwO3RzdF9kZXRhY2hfZGV2aWNlX2J5X2ZkKCkmbmJzcDtpbnRlcm5hbGx5Ljxicj48YnI+
LS0mbmJzcDs8YnI+Q3lyaWwmbmJzcDtIcnViaXM8YnI+Y2hydWJpc0BzdXNlLmN6PGJyPjxicj4t
LSZuYnNwOzxicj5NYWlsaW5nJm5ic3A7bGlzdCZuYnNwO2luZm86Jm5ic3A7aHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHA8YnI+PC9kaXY+
------=_Part_0_243795517.1595425208453--


--===============1209603114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1209603114==--

