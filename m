Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BFA16A75C
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 14:39:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2F373C2452
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 14:39:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3A7843C1414
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 14:39:12 +0100 (CET)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 26420100053F
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 14:39:08 +0100 (CET)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01ODd37B011644
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 05:39:03 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Mon, 24 Feb 2020 05:39:03 -0800
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <ltp@lists.linux.it>
References: <7885e4eb-42b0-8d4b-4bdd-85f3d37799de@windriver.com>
Message-ID: <2cfcdbb4-50c6-8f25-17bd-30282190de24@windriver.com>
Date: Mon, 24 Feb 2020 21:38:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7885e4eb-42b0-8d4b-4bdd-85f3d37799de@windriver.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.160]
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] controller case cpuset_load_balance failed
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
Content-Type: multipart/mixed; boundary="===============0056482842=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0056482842==
Content-Type: multipart/alternative;
	boundary="------------70B01B2DF4282A9A7EC0EC43"
Content-Language: en-US

--------------70B01B2DF4282A9A7EC0EC43
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

Process want to read from /dev/cpuset/cpuset.cpu_exclusive, but it get a 
wrong
filename that /dev/cpuset/cpu_exclusive in fact.
I wonder if the older version about /dev/cpuset/* are didn't have the 
"cpuset."
prefix? If that, the func cpuset_query() in *libcpuset.c*should be 
updated*.*
**

------------------------------*gdb 
messages*----------------------------------------------

load_flag (flag=0x562bdf3832ce "cpu_exclusive", flagp=0x562bdf393eb0 "",
     path=0x7ffe615fc4c0 "/dev/cpuset") at libcpuset.c:2103
2103    in libcpuset.c
(gdb) s
pathcat2 (buf=buf@entry=0x7ffe615fd4c0 "",
     name1=name1@entry=0x7ffe615fc4c0 "/dev/cpuset",
     name2=name2@entry=0x562bdf3832ce "cpu_exclusive", buflen=4096)
     at libcpuset.c:492
492     in libcpuset.c
(gdb) s
snprintf (__fmt=0x562bdf38342e "%s/%s", __n=4096, __s=0x7ffe615fd4c0 "")
     at /usr/include/bits/stdio2.h:67
67      /usr/include/bits/stdio2.h: No such file or directory.
(gdb) s
pathcat2 (buf=buf@entry=0x7ffe615fd4c0 "/dev/cpuset/cpu_exclusive",
     name1=name1@entry=0x7ffe615fc4c0 *"/dev/cpuset"*,
     name2=name2@entry=0x562bdf3832ce *"cpu_exclusive"*, buflen=4096)
     at libcpuset.c:493
493     libcpuset.c: No such file or directory.
(gdb) s
*Value returned is $4 = 0x7ffe615fd4c0 "/dev/cpuset/cpu_exclusive"*
(gdb) s
read_flag (filepath=0x7ffe615fd4c0 "/dev/cpuset/cpu_exclusive",
     flagp=0x562bdf393eb0 "") at libcpuset.c:921
921     in libcpuset.c
(gdb) s
925     in libcpuset.c
(gdb) s
*open (__oflag=0, __path=0x7ffe615fd4c0 "/dev/cpuset/cpu_exclusive")*
     at /usr/include/bits/fcntl2.h:53
53      /usr/include/bits/fcntl2.h: No such file or directory.
(gdb) s
*open /dev/cpuset/cpu_exclusive failed. erro message=No such file or 
directory*


-----------------------*cpuset_query() func as below:* 
-------------------------------

/* Set cpuset cp to the cpuset at location 'path' */
int cpuset_query(struct cpuset *cp, const char *relpath)
{
     char buf[PATH_MAX];

     if (check() < 0)
         goto err;

     fullpath(buf, sizeof(buf), relpath);

     if (load_flag(buf, &cp->cpu_exclusive, "cpu_exclusive") < 0) 
*/*should it be **"cpuset.cpu_exclusive"**???*/*
         goto err;
     cp->cpu_exclusive_valid = 1;

     if (load_flag(buf, &cp->mem_exclusive, "mem_exclusive") < 0) 
*/*should it be **"cpuset.mem_exclusive"**???*/*
         goto err;
     cp->mem_exclusive_valid = 1;

     if (load_flag(buf, &cp->notify_on_release, "notify_on_release") < 0)
         goto err;
     cp->notify_on_release_valid = 1;

     if (exists_flag(buf, "memory_migrate")) {
         if (load_flag(buf, &cp->memory_migrate, "memory_migrate") < 0)
             goto err;
         cp->memory_migrate_valid = 1;
     }

     if (exists_flag(buf, "mem_hardwall")) {
         if (load_flag(buf, &cp->mem_hardwall, "mem_hardwall") < 0)
             goto err;
         cp->mem_hardwall_valid = 1;
     }

........


On 2/21/20 10:04 PM, Xu, Yanfei wrote:
>
> Hi ,
>
> I am trying to run controller case cpuset_load_balance on my Linux 
> version 5.5.0
>
> with yocto. But I got many failures :
>
> <<<test_start>>>
> tag=cpuset_load_balance stime=1580819970
> cmdline="cpuset_load_balance_test.sh"
> contacts=""
> analysis=exit
> <<<test_output>>>
> cpuset_load_balance 1 TINFO: general group load balance test
> cpuset_load_balance 1 TINFO: root group info:
> cpuset_load_balance 1 TINFO: sched load balance: 0
> cpuset_load_balance 1 TINFO: general group info:
> cpuset_load_balance 1 TINFO: cpus: -
> cpuset_load_balance 1 TINFO: sched load balance: 1
> *cpuset_load_balance 1 TFAIL: load balance test failed.*
> cpuset_load_balance 3 TINFO: general group load balance test
> cpuset_load_balance 3 TINFO: root group info:
> cpuset_load_balance 3 TINFO: sched load balance: 0
> cpuset_load_balance 3 TINFO: general group info:
> .......
> cpuset_load_balance 25 TINFO: general group2 info:
> cpuset_load_balance 25 TINFO: cpus: 1,3
> cpuset_load_balance 25 TINFO: sched load balance: 1
> cpuset_load_balance 25 TINFO: CPU hotplug: online
> smpboot: CPU 1 is now offline
> x86: Booting SMP configuration:
> smpboot: Booting Node 0 Processor 1 APIC 0x2
> c*puset_load_balance 25 TFAIL: load balance test failed.*
> <<<execution_staLTP: starting cpuset_hotplug (cpuset_hotplug_test.sh)
> tus>>>
> initiation_status="ok"
> duration=410 termination_type=exited termination_id=1 corefile=no
> cutime=251 cstime=1188
> <<<test_end>>>
>
>
> And I tried to analyse the source code for the reason, but didn't get it.
>
> That what I found with the file cpuset_load_balance_test.sh as below:
>
> general_load_balance_test1()
> {
> ........
>
>     # start to fork the child processes
> */****(line*:108) The fork works rightly */ *
>
>     /bin/kill -s SIGUSR1 $pid 2> $CPUSET_TMP/stderr **
>     if [ $? -ne 0 ]; then
>         cpuset_log_error $CPUSET_TMP/stderr
>         tst_resm TFAIL "send the signal to fork the child tasks " \
>                "failed."
>         /bin/kill -s SIGKILL $pid
>         return 1
>     fi
>
>     read fifo < ./myfifo
>     if [ $fifo -ne 0 ]; then
>         cpuset_log_error $CPUSET_TMP/cpu-hog_stderr
>         tst_resm TFAIL "forking test tasks failed"
>         return 1
>     fi
>
>     # start to run the child processes
> */*(line:135)Something is wrong here. After the signal sent out, the 
> child processes all become zombies*/*
>     /bin/kill -s SIGUSR1 $pid 2> $CPUSET_TMP/stderr
>     if [ $? -ne 0 ]; then
>         cpuset_log_error $CPUSET_TMP/stderr
>         tst_resm TFAIL "send the signal to run the child tasks " \
>                "failed."
>         /bin/kill -s SIGUSR2 $pid
>         return 1
>     fi
> */*(line:143) Something is wrong here. wait returns value 1*/*
> wait $pid
> ...........
> }
>
> Then I saw the file cpuset_cpu_hog.c for the zombies proccess with 
> gdb. It seems
>
> cpuset_cpusetofpid func(line:190) failed. But I didn't konw more about 
> these cpuset
>
> func.
>
> Have you met problems about cpuset_load_balance like this?
>
>
> Thanks!
>
> Yanfei,
>
>

--------------70B01B2DF4282A9A7EC0EC43
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hello,<br>
    </p>
    Process want to read from /dev/cpuset/cpuset.cpu_exclusive, but it
    get a wrong <br>
    filename that /dev/cpuset/cpu_exclusive in fact. <br>
    I wonder if the older version about /dev/cpuset/* are didn't have
    the "cpuset."<br>
    prefix? If that, the func cpuset_query() in <strong
      class="final-path" style="box-sizing: border-box; font-weight:
      600; color: rgb(36, 41, 46); font-family: -apple-system,
      BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial,
      sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI
      Emoji&quot;; font-size: 16px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;">libcpuset.c</strong><span
      style="box-sizing: border-box; color: rgb(36, 41, 46);
      font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe
      UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color
      Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; letter-spacing: normal; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;" class="final-path"></span><span
      style="box-sizing: border-box; color: rgb(36, 41, 46);
      font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe
      UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color
      Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; letter-spacing: normal; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;" class="final-path">
      should be updated</span><strong class="final-path"
      style="box-sizing: border-box; font-weight: 600; color: rgb(36,
      41, 46); font-family: -apple-system, BlinkMacSystemFont,
      &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple
      Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; letter-spacing: normal; orphans: 2;
      text-align: start; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 2; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255); text-decoration-style: initial; text-decoration-color:
      initial;">.</strong><br>
    <strong class="final-path" style="box-sizing: border-box;
      font-weight: 600; color: rgb(36, 41, 46); font-family:
      -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;,
      Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;,
      &quot;Segoe UI Emoji&quot;; font-size: 16px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"></strong>
    <p>------------------------------<b>gdb messages</b>----------------------------------------------<br>
    </p>
    <font size="-1">load_flag (flag=0x562bdf3832ce "cpu_exclusive",
      flagp=0x562bdf393eb0 "",<br>
          path=0x7ffe615fc4c0 "/dev/cpuset") at libcpuset.c:2103<br>
      2103    in libcpuset.c<br>
      (gdb) s<br>
      pathcat2 (buf=buf@entry=0x7ffe615fd4c0 "",<br>
          name1=name1@entry=0x7ffe615fc4c0 "/dev/cpuset",<br>
          name2=name2@entry=0x562bdf3832ce "cpu_exclusive", buflen=4096)<br>
          at libcpuset.c:492<br>
      492     in libcpuset.c<br>
      (gdb) s<br>
      snprintf (__fmt=0x562bdf38342e "%s/%s", __n=4096,
      __s=0x7ffe615fd4c0 "")<br>
          at /usr/include/bits/stdio2.h:67<br>
      67      /usr/include/bits/stdio2.h: No such file or directory.<br>
      (gdb) s<br>
      pathcat2 (buf=buf@entry=0x7ffe615fd4c0
      "/dev/cpuset/cpu_exclusive",<br>
          name1=name1@entry=0x7ffe615fc4c0 <b>"/dev/cpuset"</b>,<br>
          name2=name2@entry=0x562bdf3832ce <b>"cpu_exclusive"</b>,
      buflen=4096)<br>
          at libcpuset.c:493<br>
      493     libcpuset.c: No such file or directory.<br>
      (gdb) s<br>
      <b>Value returned is $4 = 0x7ffe615fd4c0
        "/dev/cpuset/cpu_exclusive"</b><br>
      (gdb) s<br>
      read_flag (filepath=0x7ffe615fd4c0 "/dev/cpuset/cpu_exclusive",<br>
          flagp=0x562bdf393eb0 "") at libcpuset.c:921<br>
      921     in libcpuset.c<br>
      (gdb) s<br>
      925     in libcpuset.c<br>
      (gdb) s<br>
      <b>open (__oflag=0, __path=0x7ffe615fd4c0
        "/dev/cpuset/cpu_exclusive")</b><br>
          at /usr/include/bits/fcntl2.h:53<br>
      53      /usr/include/bits/fcntl2.h: No such file or directory.<br>
      (gdb) s<br>
      <b>open /dev/cpuset/cpu_exclusive failed. erro message=No such
        file or directory</b></font><br>
    <br>
    <br>
    -----------------------<b>cpuset_query() func as below:</b>
    -------------------------------<br>
    <br>
    <font size="-1">/* Set cpuset cp to the cpuset at location 'path' */</font><br>
    <font size="-1">int cpuset_query(struct cpuset *cp, const char
      *relpath)<br>
      {<br>
          char buf[PATH_MAX];<br>
      <br>
          if (check() &lt; 0)<br>
              goto err;<br>
      <br>
          fullpath(buf, sizeof(buf), relpath);<br>
      <br>
          if (load_flag(buf, &amp;cp-&gt;cpu_exclusive, "cpu_exclusive")
      &lt; 0)                    <b> /*should it be </b></font><font
      size="-1"><b><font size="-1">"cpuset.cpu_exclusive"</font></b><b>???*/</b><br>
              goto err;<br>
          cp-&gt;cpu_exclusive_valid = 1;<br>
      <br>
          if (load_flag(buf, &amp;cp-&gt;mem_exclusive, "mem_exclusive")
      &lt; 0)             <b> /*should it be </b></font><font size="-1"><b><font
          size="-1">"cpuset.mem_exclusive"</font></b><b>???*/</b><br>
              goto err;<br>
          cp-&gt;mem_exclusive_valid = 1;<br>
      <br>
          if (load_flag(buf, &amp;cp-&gt;notify_on_release,
      "notify_on_release") &lt; 0)<br>
              goto err;<br>
          cp-&gt;notify_on_release_valid = 1;<br>
      <br>
          if (exists_flag(buf, "memory_migrate")) {<br>
              if (load_flag(buf, &amp;cp-&gt;memory_migrate,
      "memory_migrate") &lt; 0)<br>
                  goto err;<br>
              cp-&gt;memory_migrate_valid = 1;<br>
          }<br>
      <br>
          if (exists_flag(buf, "mem_hardwall")) {<br>
              if (load_flag(buf, &amp;cp-&gt;mem_hardwall,
      "mem_hardwall") &lt; 0)<br>
                  goto err;<br>
              cp-&gt;mem_hardwall_valid = 1;<br>
          }</font><br>
    <p>........</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/21/20 10:04 PM, Xu, Yanfei wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7885e4eb-42b0-8d4b-4bdd-85f3d37799de@windriver.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
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
        duration=410 termination_type=exited termination_id=1
        corefile=no<br>
        cutime=251 cstime=1188<br>
        &lt;&lt;&lt;test_end&gt;&gt;&gt;</font>
      <p><br>
      </p>
      <p>And I tried to analyse the source code for the reason, but
        didn't get it.  <br>
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
                tst_resm TFAIL "send the signal to fork the child tasks
        " \<br>
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
      <p>cpuset_cpusetofpid func(line:190) failed. But I didn't konw
        more about these cpuset</p>
      <p>func.</p>
      <p>Have you met problems about cpuset_load_balance like this?</p>
      <p><br>
      </p>
      <p>Thanks!</p>
      <p>Yanfei,<br>
      </p>
      <p><br>
      </p>
    </blockquote>
  </body>
</html>

--------------70B01B2DF4282A9A7EC0EC43--

--===============0056482842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0056482842==--
