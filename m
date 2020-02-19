Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DDB164502
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 14:08:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4C0E3C24B7
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 14:08:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 33C9C3C0878
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 14:08:08 +0100 (CET)
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 92C601001963
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 14:07:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=eozt/
 qWw0rcyrdU1IHpIxUtCvYMamOCfxXsgcAlK7nc=; b=UCEcRF1LXwq4xJTZF4PNv
 rbODsL/gOcDF4Lfvklx8Tk0X7INvFnVTxDGw7er3IDPanvQ3TdWHBs6Pf2jMt2M6
 4DX1fBf1haQok4KVAS867swuRDZWHSwdzf6yud/VpBOQxauucH7kxsC08QPM0DPc
 oqb0pShkoUqGZ3MVC8ZH+k=
Received: from [172.20.10.4] (unknown [122.96.42.253])
 by smtp5 (Coremail) with SMTP id HdxpCgD34dIuM01eWG9YAA--.2459S2;
 Wed, 19 Feb 2020 21:07:58 +0800 (CST)
To: Li Wang <liwang@redhat.com>
References: <20200218115918.32203-1-liwang@redhat.com>
 <0774e1e5-c326-e4aa-8c74-45de61d8276b@163.com>
 <CAEemH2c9v87NWM6k_t4d9Vi3wAYYjwfEJp2Cw-zG9pPHvdtV-Q@mail.gmail.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <701290c2-4cd6-154a-d400-7479c57ec910@163.com>
Date: Wed, 19 Feb 2020 21:07:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2c9v87NWM6k_t4d9Vi3wAYYjwfEJp2Cw-zG9pPHvdtV-Q@mail.gmail.com>
Content-Language: en-US
X-CM-TRANSID: HdxpCgD34dIuM01eWG9YAA--.2459S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr43AFyDCF18ArW7CrW3KFg_yoW5KrW7pF
 13J3srCF1UX3WkJw1xXr1rGr1UXr4DAr15AF15Jr48Cr1vvF4UGr45t3W8ArW7JFWDXa4j
 9r4xJry5Gw1vqFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jf-BNUUUUU=
X-Originating-IP: [122.96.42.253]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiqB3OXlc7NfYYBwABsU
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cleanup: avoid to generate many redundant obj
 files
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1321328793=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============1321328793==
Content-Type: multipart/alternative;
 boundary="------------40FC513146E1ADD1B07FABC3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------40FC513146E1ADD1B07FABC3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/19/20 8:20 PM, Li Wang wrote:
> Hi Xiao,
>
>     Why don't you avoid libftest.o as well if you want to build test
>     by new rule?
>
>
> That should be generated because it is the local library. In LTP 
> Makefile, the sequencing is to build the library first then 
> compile&link to the testcase. We can avoid dumping the testname.o 
> since it only exists in the last phase.

Hi Li,

Thanks for your detailed explanation.

I think you try to change the building rule, as below:

Previous rule: generate all object files and then link them at the last 
phase.

---------------------------------------------

gcc -g -O2 -g -O2 -fno-strict-aliasing -pipe -Wall -W 
-Wold-style-definition -D_FORTIFY_SOURCE=2 
-I/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/ 
-I../../../../include -I../../../../include -I../../../../include/old/  
-c -o swapoff01.o swapoff01.c
gcc -g -O2 -g -O2 -fno-strict-aliasing -pipe -Wall -W 
-Wold-style-definition -D_FORTIFY_SOURCE=2 
-I/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/ 
-I../../../../include -I../../../../include -I../../../../include/old/  
-c -o ../swapon/libswapon.o ../swapon/libswapon.c
gcc   -L/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/ 
-L../../../../lib  swapoff01.o ../swapon/libswapon.o   -lltp -o swapoff01

---------------------------------------------

Current rule: just generate some common object files(e.g. library) and 
then mix building and link at the last phase.

---------------------------------------------

gcc -g -O2 -g -O2 -fno-strict-aliasing -pipe -Wall -W 
-Wold-style-definition -D_FORTIFY_SOURCE=2 
-I/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/ 
-I../../../../include -I../../../../include -I../../../../include/old/  
-c -o ../swapon/libswapon.o ../swapon/libswapon.c
gcc -g -O2 -g -O2 -fno-strict-aliasing -pipe -Wall -W 
-Wold-style-definition -D_FORTIFY_SOURCE=2 
-I/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/ 
-I../../../../include -I../../../../include -I../../../../include/old/ 
-L/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/ 
-L../../../../lib  swapoff01.c ../swapon/libswapon.o   -lltp -o swapoff01

---------------------------------------------

Why don't you remove all object files and mix building and link at the 
last phase?

---------------------------------------------

gcc -g -O2 -g -O2 -fno-strict-aliasing -pipe -Wall -W 
-Wold-style-definition -D_FORTIFY_SOURCE=2 
-I/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/ 
-I../../../../include -I../../../../include -I../../../../include/old/ 
-L/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/ 
-L../../../../lib  swapoff01.c ../swapon/libswapon.c   -lltp -o swapoff01

---------------------------------------------

>
> And, I don't want to change too much for LTP build rule(I think it 
> works correctly), especially in the case directory some of the local 
> libraries are reused.  e.g The swapoff test needs linking to 
> ../swapon/libswapon.o, that requires libswapon.o is in the correct path.

You can build and link libswapon.c directly, as below:

---------------------------------

# grep MAKE_TARGETS Makefile
$(MAKE_TARGETS): %: ../swapon/libswapon.c

---------------------------------

Sorry, I am not sure if your improvement is the best way.

Thanks,

Xiao Yang

>
> Or, did I misunderstand your words? if yes, please correct me.
>
> -- 
> Regards,
> Li Wang

--------------40FC513146E1ADD1B07FABC3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2/19/20 8:20 PM, Li Wang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEemH2c9v87NWM6k_t4d9Vi3wAYYjwfEJp2Cw-zG9pPHvdtV-Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_quote">
          <div class="gmail_default" style="font-size:small">Hi Xiao,</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            Why don't you avoid libftest.o as well if you want to build
            test by new rule?</blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">That
              should be generated because it is the local library. In
              LTP Makefile, the sequencing is to build the library first
              then compile&amp;link to the testcase. We can avoid
              dumping the testname.o since it only exists in the last
              phase. <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Hi Li,</p>
    <p>Thanks for your detailed explanation.</p>
    <p>I think you try to change the building rule, as below:</p>
    <p>Previous rule: generate all object files and then link them at
      the last phase.</p>
    <p>---------------------------------------------</p>
    <p>gcc -g -O2 -g -O2 -fno-strict-aliasing -pipe -Wall -W
      -Wold-style-definition -D_FORTIFY_SOURCE=2
      -I/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/
      -I../../../../include -I../../../../include
      -I../../../../include/old/  -c -o swapoff01.o swapoff01.c<br>
      gcc -g -O2 -g -O2 -fno-strict-aliasing -pipe -Wall -W
      -Wold-style-definition -D_FORTIFY_SOURCE=2
      -I/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/
      -I../../../../include -I../../../../include
      -I../../../../include/old/  -c -o ../swapon/libswapon.o
      ../swapon/libswapon.c<br>
      gcc   -L/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/
      -L../../../../lib  swapoff01.o ../swapon/libswapon.o   -lltp -o
      swapoff01<br>
    </p>
    <p>---------------------------------------------<br>
    </p>
    <p>Current rule: just generate some common object files(e.g.
      library) and then mix building and link at the last phase. <br>
    </p>
    <p>---------------------------------------------</p>
    <p>gcc -g -O2 -g -O2 -fno-strict-aliasing -pipe -Wall -W
      -Wold-style-definition -D_FORTIFY_SOURCE=2
      -I/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/
      -I../../../../include -I../../../../include
      -I../../../../include/old/  -c -o ../swapon/libswapon.o
      ../swapon/libswapon.c<br>
      gcc -g -O2 -g -O2 -fno-strict-aliasing -pipe -Wall -W
      -Wold-style-definition -D_FORTIFY_SOURCE=2
      -I/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/
      -I../../../../include -I../../../../include
      -I../../../../include/old/  
      -L/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/
      -L../../../../lib  swapoff01.c ../swapon/libswapon.o   -lltp -o
      swapoff01<br>
    </p>
    <p>---------------------------------------------</p>
    <p>Why don't you remove all object files and mix building and link
      at the last phase?</p>
    <p>---------------------------------------------</p>
    <p>gcc -g -O2 -g -O2 -fno-strict-aliasing -pipe -Wall -W
      -Wold-style-definition -D_FORTIFY_SOURCE=2
      -I/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/
      -I../../../../include -I../../../../include
      -I../../../../include/old/  
      -L/root/ltp/testcases/kernel/syscalls/swapoff/../swapon/
      -L../../../../lib  swapoff01.c ../swapon/libswapon.c   -lltp -o
      swapoff01<br>
    </p>
    <p>---------------------------------------------<br>
    </p>
    <blockquote type="cite"
cite="mid:CAEemH2c9v87NWM6k_t4d9Vi3wAYYjwfEJp2Cw-zG9pPHvdtV-Q@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">And, I
              don't want to change too much for LTP build rule(I think
              it works correctly), especially in the case directory some
              of the local libraries are reused.  e.g The swapoff test
              needs linking to ../swapon/libswapon.o, that
              requires libswapon.o is in the correct path.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>You can build and link libswapon.c directly, as below:</p>
    <p>---------------------------------</p>
    <p># grep MAKE_TARGETS Makefile<br>
      $(MAKE_TARGETS): %: ../swapon/libswapon.c<br>
    </p>
    <p>---------------------------------<br>
    </p>
    <p>Sorry, I am not sure if your improvement is the best way.</p>
    <p>Thanks,</p>
    <p>Xiao Yang<br>
    </p>
    <blockquote type="cite"
cite="mid:CAEemH2c9v87NWM6k_t4d9Vi3wAYYjwfEJp2Cw-zG9pPHvdtV-Q@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">Or, did I
              misunderstand your words? if yes, please correct me.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <blockquote type="cite"
cite="mid:CAEemH2c9v87NWM6k_t4d9Vi3wAYYjwfEJp2Cw-zG9pPHvdtV-Q@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr">
            <div>Regards,<br>
            </div>
            <div>Li Wang<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------40FC513146E1ADD1B07FABC3--


--===============1321328793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1321328793==--

