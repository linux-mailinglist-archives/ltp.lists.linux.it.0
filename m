Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067B107764
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 19:33:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B90DB3C2271
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 19:33:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C412C3C224E
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 19:33:38 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 617A1140121D
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 19:33:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574447615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UwrPXOeBl29qFxzv6xIXjTB+Rui31Azd3iBdNuGluxw=;
 b=XTXBoajwyC/PxUaTn6FyaPh0zywosydMNqYNx8b1Ot1qlkRhMry9iB+FK/ews3VI0VyGqC
 0pfJ7Qwn5X55b1LJbHyQGW+ZV9+yfL+byvwMZPT0XJuh/sVl6hjyjpWJfE8Gjhmdi0cRrY
 ALJnuzC7Y7B1oqguHl5yJArm+TOlfE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-Nm2n7kc8M1e_Vbu1WMNqiw-1; Fri, 22 Nov 2019 13:33:32 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39EF4801E74;
 Fri, 22 Nov 2019 18:33:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-27.rdu2.redhat.com
 [10.10.122.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DA3662675;
 Fri, 22 Nov 2019 18:33:23 +0000 (UTC)
To: Tim.Bird@sony.com, chrubis@suse.cz
References: <cki.6D94BD5731.3IAGHB25D8@redhat.com>
 <20191120113534.GC14963@rei.lan>
 <57f8e29e-1d49-e93f-2b03-75a3fd3e6e21@redhat.com>
 <20191121093150.GA14186@rei.lan>
 <ECADFF3FD767C149AD96A924E7EA6EAF978BCF95@USCULXMSG01.am.sony.com>
From: Rachel Sibley <rasibley@redhat.com>
Message-ID: <93a3732c-6c64-b3db-44df-98e9ad825e10@redhat.com>
Date: Fri, 22 Nov 2019 13:33:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ECADFF3FD767C149AD96A924E7EA6EAF978BCF95@USCULXMSG01.am.sony.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Nm2n7kc8M1e_Vbu1WMNqiw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.4.0-rc8-4b17a56.cki
 (stable-next)
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
Cc: mm-qe@redhat.com, cki-project@redhat.com, stable@vger.kernel.org,
 ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 11/21/19 5:58 AM, Tim.Bird@sony.com wrote:
> 
> 
>> -----Original Message-----
>> From:  Cyril Hrubis
>>
>> Hi!
>>>>> One or more kernel tests failed:
>>>>>
>>>>>       ppc64le:
>>>>>        ??? LTP lite
>>>>>        ??? xfstests: ext4
>>>>
>>>> Both logs shows missing files, that may be an infrastructure problem as
>>>> well.
>>>>
>>>> Also can we include links to the logfiles here? Bonus points for showing
>>>> the snippet with the actual failure in the email as well. I takes a fair
>>>> amount of time locating them manually in the pipeline repository, it
>>>> would be much much easier just with the links to the right logfile...
> 
> My preference would be to include the failure snippet somewhere in
> the e-mail as well (as opposed to just a link).
> 
>>>>
>>>
>>> Thanks for the feedback Cyril, we did have links to each failure listed
>>> before but we were told it made the email look cluttered especially
>>> if there are multiple failures.
>>
>> So it's exactly how Dmitry described it, you can't please everyone..,
>>
>>> The test logs are sorted by arch|host|TC, is there something we can
>>> do to make it easier to find related logs ?
>>> https://artifacts.cki-project.org/pipelines/296781/logs/
>>>
>>> Maybe we can look into adding the linked logs to the bottom of the
>>> email with a reference id next to the failures in the summary, so
>>> for example:
>>>
>>>       ppc64le:
>>>        ??? LTP lite [1]
>>>        ??? xfstests: ext4 [2]
>>
>> That would work for me.
>>
> 
> Maybe combine the 'footnote' idea with the 'inline' idea, and have
> the footnote include a link to the full log and a snippet with just the
> output from the failing testcase, from the full log?
> 
>>> We could also look into merging the ltp run logs into a single file
>>> as well.
>>
>> That would make it too big I guess. Actually the only part I'm
>> interested in most of the time is the part of the log with the failing
>> test. I would be quite happy if we had logs/failures file on the
>> pipelines sever that would contain only failures extracted from
>> different logfiles. The question is if that's feasible with your
>> framework.
> 
> Fuego has an LTP log-splitter and link generator.
> It's Fuego-specific and generates
> files referred to by links in the result  tables that Fuego
> shows to users.
> 
> I don't know how CKI is generating it's data or storing it,
> but I can take a look and see if it could be applied
> to their use case.  It's a python program that is fairly small.

There is a summary log which captures overall results:
https://artifacts.cki-project.org/pipelines/296781/logs/aarch64_host_1_LTP_lite_resultoutputfile.log

Then an individual log file for each LTP testsuite, e.g:
https://artifacts.cki-project.org/pipelines/296781/logs/aarch64_host_1_LTP_lite_fs.run.log

> 
> See here:
> https://bitbucket.org/fuegotest/fuego-core/src/master/tests/Functional.LTP/parser.py

Thanks!
> 
> It might not be applicable, depending on whether CKI stores their LTP output similarly
> to how Fuego does, but IMHO it's worth taking a look.  If there is sufficient interest,
> maybe this could be generalized and submitted to upstream LTP.  The Fuego log-splitter
> produces individual files.

I think it's a good idea, as long as it can be generic enough where
someone could modify a config file for example to indicate the log
path and naming convention.

> 
> Another idea would be to write a program that takes an LTP log,
> and the name of a failing testcase, and outputs (on stdout)  the snippet from the log
> for that testcase.  I think this would be very easy to do, and might be suitable to
> use in multiple contexts: on the command line, in a report
> generator, or as a CGI script for a results server.

I logged a few tickets so our team can take a closer look and discuss 
for both failure snippets and linking LTP logs directly. I'm also
checking to see if we have anything internally.

Thanks for all the feedback.

>   -- Tim
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
