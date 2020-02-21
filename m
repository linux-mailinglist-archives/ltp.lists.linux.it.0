Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4997167F8E
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 15:04:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8380B3C2672
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 15:04:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 70E6D3C13DA
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 15:04:42 +0100 (CET)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4A3E014012B3
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 15:04:38 +0100 (CET)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01LE4ZPh027571
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 06:04:35 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Fri, 21 Feb 2020 06:04:34 -0800
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <ltp@lists.linux.it>
Message-ID: <7885e4eb-42b0-8d4b-4bdd-85f3d37799de@windriver.com>
Date: Fri, 21 Feb 2020 22:04:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [128.224.162.160]
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] controller case cpuset_load_balance failed
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
Content-Type: multipart/mixed; boundary="===============1412165449=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1412165449==
Content-Type: multipart/alternative;
	boundary="------------2FE654ED4C3CE136A470C211"
Content-Language: en-US

--------------2FE654ED4C3CE136A470C211
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi ,

I am trying to run controller case cpuset_load_balance on my Linux 
version 5.5.0

with yocto. But I got many failures :

<<<test_start>>>
tag=cpuset_load_balance stime=1580819970
cmdline="cpuset_load_balance_test.sh"
contacts=""
analysis=exit
<<<test_output>>>
cpuset_load_balance 1 TINFO: general group load balance test
cpuset_load_balance 1 TINFO: root group info:
cpuset_load_balance 1 TINFO: sched load balance: 0
cpuset_load_balance 1 TINFO: general group info:
cpuset_load_balance 1 TINFO: cpus: -
cpuset_load_balance 1 TINFO: sched load balance: 1
*cpuset_load_balance 1 TFAIL: load balance test failed.*
cpuset_load_balance 3 TINFO: general group load balance test
cpuset_load_balance 3 TINFO: root group info:
cpuset_load_balance 3 TINFO: sched load balance: 0
cpuset_load_balance 3 TINFO: general group info:
.......
cpuset_load_balance 25 TINFO: general group2 info:
cpuset_load_balance 25 TINFO: cpus: 1,3
cpuset_load_balance 25 TINFO: sched load balance: 1
cpuset_load_balance 25 TINFO: CPU hotplug: online
smpboot: CPU 1 is now offline
x86: Booting SMP configuration:
smpboot: Booting Node 0 Processor 1 APIC 0x2
c*puset_load_balance 25 TFAIL: load balance test failed.*
<<<execution_staLTP: starting cpuset_hotplug (cpuset_hotplug_test.sh)
tus>>>
initiation_status="ok"
duration=410 termination_type=exited termination_id=1 corefile=no
cutime=251 cstime=1188
<<<test_end>>>


And I tried to analyse the source code for the reason, but didn't get it.

That what I found with the file cpuset_load_balance_test.sh as below:

general_load_balance_test1()
{
........

     # start to fork the child processes
*/****(line*:108) The fork works rightly */ *

     /bin/kill -s SIGUSR1 $pid 2> $CPUSET_TMP/stderr **
     if [ $? -ne 0 ]; then
         cpuset_log_error $CPUSET_TMP/stderr
         tst_resm TFAIL "send the signal to fork the child tasks " \
                "failed."
         /bin/kill -s SIGKILL $pid
         return 1
     fi

     read fifo < ./myfifo
     if [ $fifo -ne 0 ]; then
         cpuset_log_error $CPUSET_TMP/cpu-hog_stderr
         tst_resm TFAIL "forking test tasks failed"
         return 1
     fi

     # start to run the child processes
*/*(line:135)Something is wrong here. After the signal sent out, the 
child processes all become zombies*/*
     /bin/kill -s SIGUSR1 $pid 2> $CPUSET_TMP/stderr
     if [ $? -ne 0 ]; then
         cpuset_log_error $CPUSET_TMP/stderr
         tst_resm TFAIL "send the signal to run the child tasks " \
                "failed."
         /bin/kill -s SIGUSR2 $pid
         return 1
     fi
*/*(line:143) Something is wrong here. wait returns value 1*/*
wait $pid
...........
}

Then I saw the file cpuset_cpu_hog.c for the zombies proccess with gdb. 
It seems

cpuset_cpusetofpid func(line:190) failed. But I didn't konw more about 
these cpuset

func.

Have you met problems about cpuset_load_balance like this?


Thanks!

Yanfei,



--------------2FE654ED4C3CE136A470C211
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi ,</p>
    <p>I am trying to run controller case cpuset_load_balance on my
      Linux version 5.5.0</p>
    <p> with yocto. But I got many failures :</p>
    <font size="-1">&lt;&lt;&lt;test_start&gt;&gt;&gt;<br>
      tag=cpuset_load_balance stime=1580819970<br>
      cmdline="cpuset_load_balance_test.sh"<br>
      contacts=""<br>
      analysis=exit<br>
      &lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
      cpuset_load_balance 1 TINFO: general group load balance test<br>
      cpuset_load_balance 1 TINFO: root group info:<br>
      cpuset_load_balance 1 TINFO: sched load balance: 0<br>
      cpuset_load_balance 1 TINFO: general group info:<br>
      cpuset_load_balance 1 TINFO: cpus: -<br>
      cpuset_load_balance 1 TINFO: sched load balance: 1<br>
      <b>cpuset_load_balance 1 TFAIL: load balance test failed.</b><br>
      cpuset_load_balance 3 TINFO: general group load balance test<br>
      cpuset_load_balance 3 TINFO: root group info:<br>
      cpuset_load_balance 3 TINFO: sched load balance: 0<br>
      cpuset_load_balance 3 TINFO: general group info:<br>
      .......<br>
      cpuset_load_balance 25 TINFO: general group2 info:<br>
      cpuset_load_balance 25 TINFO: cpus: 1,3<br>
      cpuset_load_balance 25 TINFO: sched load balance: 1<br>
      cpuset_load_balance 25 TINFO: CPU hotplug: online<br>
      smpboot: CPU 1 is now offline<br>
      x86: Booting SMP configuration:<br>
      smpboot: Booting Node 0 Processor 1 APIC 0x2<br>
      c<b>puset_load_balance 25 TFAIL: load balance test failed.</b><br>
      &lt;&lt;&lt;execution_staLTP: starting cpuset_hotplug
      (cpuset_hotplug_test.sh)<br>
      tus&gt;&gt;&gt;<br>
      initiation_status="ok"<br>
      duration=410 termination_type=exited termination_id=1 corefile=no<br>
      cutime=251 cstime=1188<br>
      &lt;&lt;&lt;test_end&gt;&gt;&gt;</font>
    <p><br>
    </p>
    <p>And I tried to analyse the source code for the reason, but didn't
      get it.  <br>
    </p>
    <p>That what I found with the file cpuset_load_balance_test.sh as
      below:</p>
    <font size="-1">general_load_balance_test1()<br>
      {</font><br>
    <font size="-1">........</font><font size="-1"><br>
      <br>
          # start to fork the child processes</font><br>
    <font size="-1"><font size="-1"><b> /*</b></font><font size="-1"><b><font
            size="-1"><b>(line</b>:108</font>) The fork works rightly
          */ </b></font><br>
    </font><br>
    <font size="-1">    /bin/kill -s SIGUSR1 $pid 2&gt;
      $CPUSET_TMP/stderr                   <b> </b></font><font
      size="-1"><br>
          if [ $? -ne 0 ]; then<br>
              cpuset_log_error $CPUSET_TMP/stderr<br>
              tst_resm TFAIL "send the signal to fork the child tasks "
      \<br>
                     "failed."<br>
              /bin/kill -s SIGKILL $pid<br>
              return 1<br>
          fi<br>
      <br>
          read fifo &lt; ./myfifo<br>
          if [ $fifo -ne 0 ]; then<br>
              cpuset_log_error $CPUSET_TMP/cpu-hog_stderr<br>
              tst_resm TFAIL "forking test tasks failed"<br>
              return 1<br>
          fi<br>
      <br>
    </font><font size="-1">    # start to run the child processes</font><br>
    <font size="-1"><font size="-1"><b> /*(line:135)Something is wrong
          here. After the signal sent out, the child processes all
          become zombies*/</b></font></font><br>
    <font size="-1">    /bin/kill -s SIGUSR1 $pid 2&gt;
      $CPUSET_TMP/stderr             </font><br>
    <font size="-1">    if [ $? -ne 0 ]; then</font><br>
    <font size="-1">        cpuset_log_error $CPUSET_TMP/stderr</font><br>
    <font size="-1">        tst_resm TFAIL "send the signal to run the
      child tasks " \</font><br>
    <font size="-1">               "failed."</font><br>
    <font size="-1">        /bin/kill -s SIGUSR2 $pid</font><br>
    <font size="-1">        return 1</font><br>
    <font size="-1">    fi</font><br>
    <b><font size="-1">/*(line:143) Something is wrong here. wait
        returns value 1*/</font></b><br>
    <font size="-1">wait $pid</font><br>
    <font size="-1">...........</font><br>
    }<br>
    <p>Then I saw the file cpuset_cpu_hog.c for the zombies proccess
      with gdb. It seems</p>
    <p>cpuset_cpusetofpid func(line:190) failed. But I didn't konw more
      about these cpuset</p>
    <p>func.</p>
    <p>Have you met problems about cpuset_load_balance like this?</p>
    <p><br>
    </p>
    <p>Thanks!</p>
    <p>Yanfei,<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------2FE654ED4C3CE136A470C211--

--===============1412165449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1412165449==--
