Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8E43C5E7
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 10:27:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A4D23EB0CA
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 10:27:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 1307B3EAEC6
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 10:27:16 +0200 (CEST)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D5E63600C30
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 10:27:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=H723O
 4zhbPeEvFIsmvVhS1nFFGYrM/v+U38qS1DKOaw=; b=gGoHm0c5RGGWTrWZGnMi2
 U6GwY2QEyZbNhGPPFeWK5RWutxwH919JU9cHRerAEhsEOqfUolobUg9/0HmmoWQ6
 r981tv7+4f9xtVwpNtc+QLuz3N1sl2YK7y7/ExeleootI5d9Oh5lgdL8XsufmKBB
 lwMGWl1E+5YEbpGiCxzmag=
Received: from [192.168.1.168] (unknown [112.25.212.39])
 by smtp8 (Coremail) with SMTP id DMCowAAHDnLfZf9cBLuDAw--.2789S2;
 Tue, 11 Jun 2019 16:27:12 +0800 (CST)
To: Christian Amann <camann@suse.com>, ltp@lists.linux.it
References: <1559989633-24711-1-git-send-email-ice_yangxiao@163.com>
 <e260a2b5-85cc-2ee6-d38b-0acd19c73347@suse.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <67af896c-e917-3e3b-f724-be13f402e562@163.com>
Date: Tue, 11 Jun 2019 16:27:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <e260a2b5-85cc-2ee6-d38b-0acd19c73347@suse.com>
Content-Language: en-US
X-CM-TRANSID: DMCowAAHDnLfZf9cBLuDAw--.2789S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgqQDUUUUU
X-Originating-IP: [112.25.212.39]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbB0hTQXlUMPkUUCwAAs1
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/acct02.c: Fix EMFILE error
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
Content-Type: multipart/mixed; boundary="===============0926865676=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============0926865676==
Content-Type: multipart/alternative;
 boundary="------------D2397F18CA1BB2FA78113CF3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D2397F18CA1BB2FA78113CF3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Pushed, thanks for your confirm. :-)

Best Regards,

Xiao Yang

On 06/11/2019 01:53 PM, Christian Amann wrote:
> Tested-by: Christian Amann<camann@suse.com>


--------------D2397F18CA1BB2FA78113CF3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi,</p>
    <p>Pushed, thanks for your confirm.  <span class="moz-smiley-s1"><span>:-)</span></span></p>
    <p>Best Regards,</p>
    <p>Xiao Yang<br>
    </p>
    <div class="moz-cite-prefix">On 06/11/2019 01:53 PM, Christian Amann
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e260a2b5-85cc-2ee6-d38b-0acd19c73347@suse.com">
      <pre wrap="">Tested-by: Christian Amann <a class="moz-txt-link-rfc2396E" href="mailto:camann@suse.com" moz-do-not-send="true">&lt;camann@suse.com&gt;</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------D2397F18CA1BB2FA78113CF3--


--===============0926865676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0926865676==--

